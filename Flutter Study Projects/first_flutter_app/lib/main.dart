import 'package:flutter/material.dart';

// 앱 시작 부분
void main() {
  runApp(const MyApp());
}

// 시작 클래스 (material 디자인 앱 생성)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(), // 표시할 화면의 인스턴스
    );
  }
}

// 시작 클래스가 실제로 표시하는 클래스 (매인화면)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomePage 클래스의 상태를 나타내는 State 클래스
class _MyHomePageState extends State<MyHomePage> {
  // 화면에 UI를 그리는 메서드 (그려질 위젯을 반환)
  @override
  Widget build(BuildContext context) {
    return Scaffold(); // material 디자인으 ㅣ기본 뼈대 위젯
  }
}
