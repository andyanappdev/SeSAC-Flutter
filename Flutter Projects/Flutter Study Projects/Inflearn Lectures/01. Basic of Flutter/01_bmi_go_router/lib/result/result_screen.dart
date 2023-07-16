import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height; // main_screen에서 부터 전달 받은 height 값을 담아 두는 상수
  final double weight; // main_screen에서 부터 전달 받은 weight 값을 담아 두는 상수

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  // bmi 계산 값을 가지고 결과 문자열을 return하는 함수
  String _calBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      result = '고도 비만';
    } else if (bmi >= 30) {
      result = '2단계 비만';
    } else if (bmi >= 25) {
      result = '1단계 비만';
    } else if (bmi >= 23) {
      result = '과체중';
    } else if (bmi >= 18.5) {
      result = '정상';
    }
    return result;
  }

  // bmi 계산 값을 가지고 결과 icon을 return하는 함수
  Widget _buildIcon(double bmi) {
    if (bmi >= 23) {
      return const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      return const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    } else {
      return const Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // BMI 계산 logic
    final double bmi = weight / ((height / 100.0) * (height / 100.0));

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calBmi(bmi),
              style: const TextStyle(fontSize: 36),
            ),
            _buildIcon(bmi),
          ],
        ),
      ),
    );
  }
}
