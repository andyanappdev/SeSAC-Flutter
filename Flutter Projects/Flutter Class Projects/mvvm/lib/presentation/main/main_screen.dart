import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mvvm/presentation/main/main_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// ViewModel을 사용하기 위한 인스턴스를 생성하여 준비
  final viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MVVM Practice'),
        ),
        body: Container(
          /// 직접 view에서 색상을 설정해 주는 것이 아니라 ViewModel에 접근하여 상태를 가져와서 설정
          color: viewModel.color,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  final random = Random();
                  if (viewModel.color == Colors.white) {
                    /// 색상 변경 메서드를 사용하여 색상을 변경
                    viewModel.changeColor(Color.fromRGBO(
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextDouble(),
                    ));
                  } else {
                    viewModel.changeColor(Colors.white);
                  }
                });
              },

              /// 버튼의 label을 ViewModel에 접근하여 상태를 가져와서 설정
              child: Text(viewModel.buttonText),
            ),
          ),
        ),
      ),
    );
  }
}
