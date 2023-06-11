import 'package:flutter/material.dart'; //  material 디자인 위젯들이 포함되어 있는 라이브러리

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

// 시작 클래스가 실제로 표시하는 클래스 (매인화면)
/*
MyHomePage 클래스는 StatefulWidget 클래스를 상속 받은 subclass
상태가 있는 위젯을 정의하는 StatefulWidget 클래스 사용
 */
class MyHomePage extends StatefulWidget {
  // MyHomePage 클래스의 생성자는 key와 title property를 옵션으로 받아서 super키워드를 사용하여 superclass의 생성자에 key를 전달
  const MyHomePage({super.key});

  @override
  // MyHomePage 클래스에는 상속 받은 createState() 메서드를 재정의하여 _MyHomePageState() 클래스의 인스턴스를 return
  // createState() 메서드는 StatefulWidget이 생성될 때 한번만 실행!
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomePage 클래스의 상태를 나타내는 State 클래스
/*
_MyHomePageState 클래스는 State<MyHomePage> 클래스를 상속 받은 subclass
State 클래스를 상속 받은 클래스를 상태 클래스라고 한다.
상태 클래스는 변경 가능한 상태를 property 변수로 표현 하며, 해당 변수의 값을 변경하여 화면을 다시 그릴수 있다.
 */
class _MyHomePageState extends State<MyHomePage> {
  /*
   화면에 UI를 그리는 메서드 (그려질 위젯을 반환)
   build() 메서드를 가지고 있으며 이곳에 화면에 그려질 부분을 정의
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text(
          '0',
          style: TextStyle(
            color: Colors.red,
            fontSize: 70,
          ),
        ),
      ),
    ); // material 디자인 기본 뼈대 위젯
  }
}
