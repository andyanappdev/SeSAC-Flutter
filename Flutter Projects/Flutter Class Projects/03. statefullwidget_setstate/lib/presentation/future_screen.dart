import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  String text = '이곳에 표시!!!';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future with setState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading == true)
              Text(
                'Loading',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            if (isLoading == false)
              Text(
                text,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () async {
                  isLoading = true;
                  // 화면 갱신
                  setState(() {});

                  text = await getString();
                  isLoading = false;
                  // 화면 갱신
                  setState(() {});
                },
                child: const Text('Future 실행'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<String> getString() async {
  await Future.delayed(const Duration(seconds: 3));
  return 'Hello Future';
}
