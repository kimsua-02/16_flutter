
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  List<Contact> _contacts = [];

// 위젯이 호출되고 제일 먼저 실행될 메소드
  @override
  void initState() {
    super.initState();
    _checkPermissionAndFetchContactss();
  }

  // 연락처를 동적으로 추가하기 위한 메소드
  addContact(a){
    setState(() {
      _contacts.add(a);
    });
  }

  // 권한 체크 및 연락처 가져오는 메소드
  Future<void> _checkPermissionAndFetchContactss() async {
    // 연락처 접근 권한 요청
    PermissionStatus permission = await Permission.contacts.request();

    // 권한 허용 체크
    if(permission.isGranted) {
      _getContacts();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("연락처 권한이 필요합니다.")));
    }
  }

  // 연락처를 실제로 가져오는 메소드
  Future<void> _getContacts() async {
    try {

    final contacts = await FlutterContacts.getContacts(
      withProperties: true, withPhoto: false);

    setState(() {
      _contacts = contacts; // 가져온 연락처 데이터를 저장함.
    });
        } catch (e) {
      print("연락처를 가져오는 중 오류 발생 : $e");
      }
  }

  // 연락처 추가를 위한 다이얼로그 메소드
  void showAddContactDialog() {
    String name = '';  // 새 연락처 이름
    String phone = ''; // 새 연락처 전화번호

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("새 연락처 추가"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "이름"),
                  onChanged: (value){
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "전화번호"),
                  keyboardType: TextInputType.phone, // 전화번호 입력 모드
                  onChanged: (value){
                    phone = value;
                  },
                )
              ],
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("취소")),
              TextButton(onPressed: (){
                if(name.isNotEmpty && phone.isNotEmpty){
                  _addContact(name,phone);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("이름과 전화번호를 모두 입력해주세요.")
                  ));
                }
              }, child: Text("등록"))
            ],
          );
        });
  }

  Future<void> _addContact(String name, String phone) async {

    // 연락처 저장 권한 확인
    if(await FlutterContacts.requestPermission()){ // 연락처 저장과 관련된 권한이 있는 지 확인

      final newContact = Contact()
        ..name.first = name
        ..phones = [Phone(phone)]; // 연락처가 한개니까 폰 객체 리스트를 넣음
      await newContact.insert();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("새 연락처 등록이 저장되었습니다."),
      ));
      _getContacts();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("저장권한이 필요합니다."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 연락처 목록 표시 영역
        Expanded(child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context,i){
            var contact = _contacts[i];
            return ListTile(
              title: Text(contact.displayName),
              subtitle: Text(contact.phones.isNotEmpty
                ? contact.phones.first.number
                : "전화번호 없음"),
            );
          },
        )),
        Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: (){
              showAddContactDialog();
            },
              child: Text("연락처 추가")),
        )
      ],
    );
  }
}
