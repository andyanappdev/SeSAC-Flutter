import 'package:flutter/material.dart';

// 시작 클래스가 실제로 표시하는 클래스 (매인화면)
/*
MyHomePage 클래스는 StatefulWidget 클래스를 상속 받은 subclass
상태가 있는 위젯을 정의하는 StatefulWidget 클래스 사용
 */
class MainPage extends StatefulWidget {
  // MyHomePage 클래스의 생성자는 key와 title property를 옵션으로 받아서 super키워드를 사용하여 superclass의 생성자에 key를 전달
  const MainPage({super.key});

  @override
  // MyHomePage 클래스에는 상속 받은 createState() 메서드를 재정의하여 _MyHomePageState() 클래스의 인스턴스를 return
  // createState() 메서드는 StatefulWidget이 생성될 때 한번만 실행!
  State<MainPage> createState() => _MainPageState();
}

// MyHomePage 클래스의 상태를 나타내는 State 클래스
/*
_MyHomePageState 클래스는 State<MyHomePage> 클래스를 상속 받은 subclass
State 클래스를 상속 받은 클래스를 상태 클래스라고 한다.
상태 클래스는 변경 가능한 상태를 property 변수로 표현 하며, 해당 변수의 값을 변경하여 화면을 다시 그릴수 있다.
 */
class _MainPageState extends State<MainPage> {
  int number = 0;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // column 위치 설정 (가운데 정렬)
          children: [
            Text(
              'Number',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
              ),
            ),
            Text(
              '$number', // 화면에 표시될 숫자를 count 변수 사용
              style: TextStyle(
                color: Colors.red,
                fontSize: 70,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('ElevateButton');
              },
              child: Text('ElevateButton'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('TextButton'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('OutlinedButton'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 화면 다시 그리기
          setState(() {
            number++;
          });
        }, // button이 눌렸을때 작동하는 코드를 중괄호 안에 작성
        child: Icon(Icons.add),
      ),
    ); // material 디자인 기본 뼈대 위젯
  }
}
