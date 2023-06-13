import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height; // main_screen에서 부터 전달 받은 height 값을 담아 두는 상수
  final double weight; // main_screen에서 부터 전달 받은 weight 값을 담아 두는 상수

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '정상',
              style: TextStyle(fontSize: 36),
            ),
            Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.green,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
