import 'package:flutter/material.dart';

//  ChangeNotifier(mixin type : with 사용)를 상속 받아서 구현하여 변경되는 상태를 ChangeNotifierProvider에게 통지해 줄수 있다.
class MainViewModel with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners(); // listener() 메서드를 호출하여 상태 변경 사항을 provider에게 통지
  }
}
