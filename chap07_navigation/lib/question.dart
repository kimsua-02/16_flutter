

/*
* 영화 관리 앱
*  - BottomNavigationBarItem 로 "영화 목록", "영화 등록", "영화 검색" 페이지 클릭할 때마다 이동 되게 [ 구현 ]
*  - 영화 등록 페이지에서 영화 등록 시 TextField 로 영화 제목, 감독, 내용 입력 받기 [ 구현 ]
*  - 영화 등록 페이지에서 영화 등록 시 영화 목록에 등록한 영화가 나타나게 [ 구현 ]
*  - 영화 목록 페이지에서 영화 등록 전 "등록된 영화가 없습니다" 띄움  [ 구현 ]
*  - 영화 목록 페이지에서 영화 등록 후 삭제도 가능  [ 구현 ]
*  - 영화 삭제는 Icons.delete 아이콘으로  [ 구현 ]
*  - 영화 검색 페이지에서 "검색" 클릭 시 등록한 영화 나오도록  [ 미구현 ]
* */

import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {

  MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

// 메인 페이지를 관리하는 Stateful 위젯
class _MoviePageState extends State<MoviePage> {

  // 현재 선택된 하단 네비게이션 바의 인덱스
  int _selectedIndex = 0;

  // 영화 데이터를 관리하는 리스트
  final List<Map<String, String>> _movies = [];

  // 현재 선택된 페이지를 반환하는 함수
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
        return MovieSearchPage(
          movies: _movies,
        ); // 영화 검색 페이지
      default:
        // 기본 페이지 (잘못된 인덱스 처리)
        return Center(child: Text("페이지 없음"));
    }
  }

  // 영화 데이터 추가 함수
  void _addMovie(Map<String, String> movie) {
    setState(() {
      _movies.add(movie);
    });
  }

  // 영화 데이터 삭제 함수
  void _deleteMovie(int index) {
    setState(() {
      _movies.removeAt(index);
    });
  }

  // 네비게이션 바 선택 변경 처리
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("영화 관리 앱"),  // 상단 AppBar 타이틀
      ),
      body: _getPage(), // 현재 선택된 페이지를 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // 선택 변경 처리 함수
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "영화 목록",   // 영화 목록
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: "영화 등록",   // 영화 등록
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "영화 검색",   // 영화 검색
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

// 영화 검색 페이지
class MovieSearchPage extends StatefulWidget {

  final List<Map<String, String>> movies;

  MovieSearchPage({super.key, required this.movies});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = widget.movies;
  }

  void _searchMovies(String query) {
    setState(() {
      if(query.isEmpty) {
        _filteredMovies = widget.movies;
      } else {
        _filteredMovies = widget.movies
            .where((movie) =>
            movie['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "영화 검색",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(icon: Icon(Icons.clear),
                onPressed: (){
                  _searchController.clear();
                  _searchMovies('');
                },
                )
              ),
              onChanged: _searchMovies,
            ),
            SizedBox(height: 20),
            Expanded(child: _filteredMovies.isEmpty
                ? Center(child: Text("검색 결과가 없습니다."))
                : ListView.builder(
                    itemCount: _filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = _filteredMovies[index];
                      return ListTile(
                        title: Text(movie['title'] ?? "제목없음"),
                        subtitle: Text(movie['director'] ?? "감독없음"),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>
                              MovieDetailPage(movie: movie,)
                          ));
                        },
                      );
                    },
              )
            )
          ],
        ),
      ),
    );
  }
}


// 영화 목록을 표시하는 Stateless 위젯
class MovieListPage extends StatelessWidget {
  final List<Map<String, String>> movies;   // 영화 데이터 리스트
  final Function(int) onDelete;       // 영화 삭제 함수

  MovieListPage({super.key, required this.movies, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty
        ? Center(child: Text("등록된 영화가 없습니다"))   // 영화가 없을 때 표시
        : ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];  // 현재 영화 데이터
        return ListTile(
          title: Text(movie['title'] ?? "제목 없음"),   // 영화 제목
          subtitle: Text(movie['director'] ?? "감독 없음"), // 영화 감독
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red), // 삭제 아이콘
            onPressed: () {
              // 삭제 확인 다이얼 로그 표시
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
            // 영화 상세 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movie: movie),  // 상세 페이지 생성
              ),
            );
          },
        );
      },
    );
  }
}

// 영화 등록 기능을 제공하는 Stateful 위젯
class MovieRegistrationPage extends StatefulWidget {
  final Function(Map<String, String>) onAddMovie; // 영화 추가 함수

  MovieRegistrationPage({super.key, required this.onAddMovie});

  @override
  State<MovieRegistrationPage> createState() => _MovieRegistrationPageState();
}

class _MovieRegistrationPageState extends State<MovieRegistrationPage> {
  // 텍스트 입력 필드 컨트롤러
  final TextEditingController _movieTitle = TextEditingController();
  final TextEditingController _movieDirector = TextEditingController();
  final TextEditingController _movieContent = TextEditingController();

  // 영화 등록 처리
  void _registerMovie() {
    if (_movieTitle.text.isNotEmpty &&
        _movieDirector.text.isNotEmpty &&
        _movieContent.text.isNotEmpty) {
      
      // 입력 필드가 모두 비어있지 않을 때
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
                  'title': _movieTitle.text,      // 제목 추가
                  'director': _movieDirector.text,  // 감독 추가
                  'content': _movieContent.text,    // 내용 추가
                });

                // 입력 필드 초기화
                _movieTitle.clear();
                _movieDirector.clear();
                _movieContent.clear();

                Navigator.of(context).pop();  // 다이얼 로그 닫기
              },
              child: Text("확인"),
            ),
          ],
        ),
      );
    } else {
      // 입력 필드가 비어 있을 때
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


// 영화 상세 정보를 표시하는 Stateless 위젯
class MovieDetailPage extends StatelessWidget {
  final Map<String, String> movie;  // 영화 데이터

  MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title'] ?? "제목 없음"),  // 상단 타이틀
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
