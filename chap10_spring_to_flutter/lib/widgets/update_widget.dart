

import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';


class MenuUpdateWidget extends StatefulWidget {
  const MenuUpdateWidget({super.key});

  @override
  State<MenuUpdateWidget> createState() => _MenuUpdateWidgetState();
}

class _MenuUpdateWidgetState extends State<MenuUpdateWidget> {


  TextEditingController _menuNameController = TextEditingController();
  TextEditingController _menuPriceController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _orderableController = TextEditingController();

  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = []; // 메뉴 목록을 담을 리스트
  dynamic _selectedMenu; // 선택된 메뉴

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  // 메뉴 목록을 불러오는 함수
  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  // 선택된 메뉴 업데이트 함수
  void _onMenuSelected(dynamic menu) {
    setState(() {
      _selectedMenu = menu;
      _menuNameController.text = menu['menuName'];
      _menuPriceController.text = menu['menuPrice'].toString();
      _categoryController.text = menu['categoryCode'].toString();
      _orderableController.text = menu['orderableStatus'];
    });
  }

  // 수정 메뉴 등록 메소드
  void _registMenu() async {
    Map<String, dynamic> menuData = {
      'menuCode': _selectedMenu['menuCode'],
      'menuName': _menuNameController.text,
      'menuPrice': int.parse(_menuPriceController.text),
      'categoryCode': int.parse(_categoryController.text),
      'orderableStatus': _orderableController.text,
    };

    try {
      String result = await _menuModel.updateMenu(menuData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );

      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error : $e')),
      );
    }
  }


    @override
    Widget build(BuildContext context) {
      return Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton(
              value: _selectedMenu,
              hint: Text("메뉴 선택"),
              onChanged: (dynamic newValue) {
                _onMenuSelected(newValue);
              },
              items: _menus.map((dynamic menu) {
                return DropdownMenuItem(
                  value: menu,
                  child: Text(menu['menuName']),
                );
              }).toList(),
            ),
            TextField(
              controller: _menuNameController,
              decoration: InputDecoration(labelText: "메뉴 이름"),
            ),
            TextField(
              controller: _menuPriceController,
              decoration: InputDecoration(labelText: "메뉴 가격"),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: "카테고리 코드"),
            ),
            TextField(
              controller: _orderableController,
              decoration: InputDecoration(labelText: "판매 여부"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _registMenu, child: Text("메뉴 수정하기"))
          ],
        ),
      );
    }
  }
