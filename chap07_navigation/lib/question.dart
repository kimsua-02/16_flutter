

/*
* 영화 관리 앱
*  - BottomNavigationBarItem 로 "영화 목록", "영화 등록", "영화 검색" 페이지 클릭할 때마다 이동 되게 [구현]
*  - 영화 등록 페아지에서 영화 등록 시 TextField 로 영화 제목, 영화 감독 입력 받기 [구현]
*  - 영화 등록 페이지에서 영화 등록 시 영화 목록에 등록한 영화가 나타나게 [미구현]
*  - 영화 목록 페이지에서 영화 등록 전 "등록된 영화가 없습니다" 띄움  [구현]
*  - 영화 목록 페이지에서 영화 등록 후 삭제도 가능  [미구현]
*  - 영화 삭제는 Icons.delete 아이콘으로  [미구현]
*  - 영화 검색 페이지에서 "검색" 클릭 시 등록한 영화 나오도록  [미구현]
* */

import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int _selectedIndex = 0;

  // 영화 데이터를 관리하는 리스트
  final List<Map<String, String>> _movies = [];

  // 페이지 변경 로직
  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return MovieListPage(
          movies: _movies,
          onDelete: _deleteMovie,
        ); // 영화 목록 페이지
      case 1:
        return MovieRegistrationPage(
          onAddMovie: _addMovie,
        ); // 영화 등록 페이지
      case 2:
        return Center(child: Text("영화 검색 페이지")); // 영화 검색 페이지
      default:
        return Center(child: Text("페이지 없음"));
    }
  }

  // 영화 등록 함수
  void _addMovie(Map<String, String> movie) {
    setState(() {
      _movies.add(movie);
    });
  }

  // 영화 삭제 함수
  void _deleteMovie(int index) {
    setState(() {
      _movies.removeAt(index);
    });
  }

  // 선택된 인덱스를 변경하는 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "영화 목록",
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: "영화 등록",
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "영화 검색",
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class MovieListPage extends StatelessWidget {
  final List<Map<String, String>> movies;
  final Function(int) onDelete;

  MovieListPage({super.key, required this.movies, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty
        ? Center(child: Text("등록된 영화가 없습니다"))
        : ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          title: Text(movie['title'] ?? "제목 없음"),
          subtitle: Text(movie['director'] ?? "감독 없음"),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("삭제 확인"),
                  content: Text("영화 목록을 삭제하시겠습니까?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("취소"),
                    ),
                    TextButton(
                      onPressed: () {
                        onDelete(index);
                        Navigator.of(context).pop();
                      },
                      child: Text("확인"),
                    ),
                  ],
                ),
              );
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movie: movie),
              ),
            );
          },
        );
      },
    );
  }
}

class MovieRegistrationPage extends StatefulWidget {
  final Function(Map<String, String>) onAddMovie;

  MovieRegistrationPage({super.key, required this.onAddMovie});

  @override
  State<MovieRegistrationPage> createState() => _MovieRegistrationPageState();
}

class _MovieRegistrationPageState extends State<MovieRegistrationPage> {
  final TextEditingController _movieTitle = TextEditingController();
  final TextEditingController _movieDirector = TextEditingController();
  final TextEditingController _movieContent = TextEditingController();

  void _registerMovie() {
    if (_movieTitle.text.isNotEmpty &&
        _movieDirector.text.isNotEmpty &&
        _movieContent.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("등록 확인"),
          content: Text("영화를 등록하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                widget.onAddMovie({
                  'title': _movieTitle.text,
                  'director': _movieDirector.text,
                  'content': _movieContent.text,
                });

                // 입력 필드 초기화
                _movieTitle.clear();
                _movieDirector.clear();
                _movieContent.clear();

                Navigator.of(context).pop();
              },
              child: Text("확인"),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("모든 필드를 입력해주세요.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _movieTitle,
              decoration: InputDecoration(labelText: "영화 제목"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _movieDirector,
              decoration: InputDecoration(labelText: "감독"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _movieContent,
              decoration: InputDecoration(labelText: "내용"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerMovie,
              child: Text("영화 등록"),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Map<String, String> movie;

  MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title'] ?? "제목 없음"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${movie['title'] ?? "제목 없음"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(" ${movie['director'] ?? "감독 없음"}"),
            SizedBox(height: 10),
            Text("${movie['content'] ?? "내용 없음"}"),
          ],
        ),
      ),
    );
  }
}
