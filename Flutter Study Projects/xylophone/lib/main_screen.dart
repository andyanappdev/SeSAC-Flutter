import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 가로 모드 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Xylophone'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: gunban('도', Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: gunban('레', Colors.orange),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: gunban('미', Colors.indigo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: gunban('파', Colors.yellow),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: gunban('솔', Colors.cyan),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 56.0),
            child: gunban('라', Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: gunban('시', Colors.green),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: gunban('도', Colors.purple),
          ),
        ],
      ),
    );
  }

  Widget gunban(String text, Color color) {
    return Container(
        width: 50,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(
            '$text',
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
