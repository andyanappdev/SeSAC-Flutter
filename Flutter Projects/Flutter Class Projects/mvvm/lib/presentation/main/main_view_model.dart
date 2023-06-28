import 'package:flutter/material.dart';

class MainViewModel {
  // 변수 (상태)
  Color _color = Colors.white;
  // color 상태를 변경할수 없도록 private으로 처리 하였기 때문에 color 상태를 가져갈수 있는 getter를 구현
  Color get color => _color;

  String _buttonText = 'Change color';
  String get buttonText => _buttonText;

  // 수정은 메서드를 통해서만 하도록 구현
  void changeColor(Color color) {
    _color = color;
  }

  // login 기능이 필요하다면 아래와 같은 메서드를 구현하여 제공
  void login() {
    // login 관련 로직 작성
  }
}
