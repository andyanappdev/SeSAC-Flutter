import 'package:flutter/cupertino.dart'; // iOS style widget을 사용하기 위한 cupertino 라이브러리 import

class IosStyleScreen extends StatefulWidget {
  const IosStyleScreen({super.key});

  @override
  State<IosStyleScreen> createState() => _IosStyleScreenState();
}

class _IosStyleScreenState extends State<IosStyleScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino App'),
        ),
        child: Center(
          child: Text('Cupertino App'),
        ),
      ),
    );
  }
}
