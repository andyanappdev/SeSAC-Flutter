import 'package:flutter/material.dart';

class MainTapScreen extends StatefulWidget {
  const MainTapScreen({super.key});

  @override
  State<MainTapScreen> createState() => _MainTapScreenState();
}

class _MainTapScreenState extends State<MainTapScreen> {
  int _currentIndex = 0; // BottomNavigationBar의 currentIndex 값을 담아둘 변수 생성

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // bottomNavigationBar의 아이템이 눌렷을때
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // BottomNavigationBar 눌린 아이템의 index값을 _currentIndex에 할당하고 화면갱신 하여 반영
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
        ],
      ),
    );
  }
}
