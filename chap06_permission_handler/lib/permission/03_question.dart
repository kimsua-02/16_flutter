
/*
*  - 카메라로 사진 촬영 시 이미지가 세로로 정렬됨. [구현]
*   -> 이미지가 세로로 정렬되려면 컬럼 안에 children 안에 맵 [구현]
*  - 이미지가 변수로 저장됨. [구현]
*  - 이미지 클릭 시 다이얼 로그로 '미리보기' 텍스트 넣음. [구현]
*  - 이미지 미리보기 는 다이얼 로그로 이미지 삭제 유무 지정 [구현]
*  - 이미지 촬영 후 등록 시 로딩 아이콘 뜨게 [구현]
*   -> bool isLoading = false;
* */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraQuestionPage extends StatefulWidget {
  const CameraQuestionPage({super.key});

  @override
  State<CameraQuestionPage> createState() => _State();
}

class _State extends State<CameraQuestionPage> {

  List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  // 갤러리에서 이미지를 선택하는 메소드
  Future<void> _pickImageFromImage() async {
    setState(() {
      _isLoading = true;
    });

    final XFile? pickeredFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickeredFile != null) {
      setState(() {
        _images.add(File(pickeredFile.path));
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 카메라에서 이미지 촬영하는 메소드
  Future<void> _pickImageFromCamera() async {
    setState(() {
      _isLoading = true;
    });
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }
// 이미지를 삭제할 때 확인 다이얼 로그 메소드
  void _showDeleteDialog(File image) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("image Delete"),
        content: Text("정말로 이 이미지를 삭제하겠습니까?"),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              _images.remove(image);
            });
            Navigator.pop(context);
            Navigator.pop(context);
          }, child: Text("삭제")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("취소"))
        ],
      );
    });
  }

  // 미리 보기 다이얼 로그
  void _showDialog(File image) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("미리보기"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.file(image),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              _showDeleteDialog(image);
            }, child: Text("이미지 삭제"))
          ],
        ),
      );
    });
  }

  // 컬럼 안에 컬럼 버튼 버튼
  // 센터 안에 컬럼 안에 컬럼,버튼 버튼과 같이 있는 컬럼 안에 images.map
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoading
            ? CircularProgressIndicator()
            : _images.isEmpty
              ? Text("사진을 선택하세요")
              : Column(
            children: _images.map((image) {
              return GestureDetector(
                onTap: () => _showDialog(image),
                child: Image.file(
                  image,
                  width: 100,
                  height: 100,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _pickImageFromImage, child: Text("갤러리에서 사진 찍기")),
          ElevatedButton(onPressed: _pickImageFromCamera, child: Text("카메라로 사진 찍기")),
        ],
      ),
    );
  }
}
