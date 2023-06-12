import 'package:flutter/material.dart'; //  material 디자인 위젯들이 포함되어 있는 라이브러리

import 'package:first_flutter_app/my_home_page.dart'; // refactoring으로 이동한 화면을 그리는 코드가 위치한 파일 import

// 앱 시작 부분
void main() {
  runApp(const MyApp()); // runApp() 함수에 MyApp() 인스턴스를 전달한다.
}

// 시작 클래스 (material 디자인 앱 생성)
/*
MyApp 클래스는 StatelessWidget 클래스를 상속 받은 subclass
StatelessWidget 클래스는 상태(state)를 가지지 않는 위젯을 구성하는 기본 클래스
상태를 가지지 않는다 == 한번 그려진 후 다시 그리지 않는 경우를 의미함 (property로 변수를 가지지 않는다. 단 상수는 가능)
StatelessWidget 클래스는 bulid() 메서드를 가지고 있다. (위젯을 생성할 때 호출)
StatelessWidget를 상속 받은 MyApp 클래스는 MaterialApp() 인스턴스를 작성하여 return
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // bulid() 메서드가 return 하는 MaterialApp() 인스턴스
      // 아래의 properties를 설정하여 위젯의 속성을 표현
      title: 'Flutter Demo', // title 설정
      theme: ThemeData(
        // theme 설정
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(), // 표시할 화면의 인스턴스
    );
  }
}
