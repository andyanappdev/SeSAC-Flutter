import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/main_tap/account/account_screen.dart';
import 'package:instagram_clone/presentation/main_tap/home/home_screen.dart';
import 'package:instagram_clone/presentation/main_tap/search/search_screen.dart';

class MainTapScreen extends StatefulWidget {
  const MainTapScreen({super.key});

  @override
  State<MainTapScreen> createState() => _MainTapScreenState();
}

class _MainTapScreenState extends State<MainTapScreen> {
  // BottomNavigationBar의 currentIndex 값을 담아둘 변수 생성
  int _currentIndex = 0;
  // TapPage에 연결할 화면들을 리스트에 담아 둔다
  final List _pages = const [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // body에 각각의 screen의 인덱스를 이용하여 TapPage에 연결
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
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
