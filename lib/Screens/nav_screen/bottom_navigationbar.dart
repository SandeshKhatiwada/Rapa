import 'package:flutter/material.dart';
import 'package:rafa/Screens/home_page.dart';
import 'package:rafa/Screens/nav_screen/expenses_page.dart';
import 'package:rafa/Screens/nav_screen/sales_page.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentIndex = 0;
  final screens = [
    HomePage(),
    Expenses(),
    Sales(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "DASHBOARD",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.monetization_on,
                size: 30,
              ),
              label: "EXPENSES",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                size: 30,
              ),
              label: "SALES",
              backgroundColor: Colors.purple),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
