import 'package:basic_of_ui_interaction/presentation/main/components/post_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding interactivity'),
      ),
      body: ListView(
        children: const [
          PostWidget(),
          SizedBox(
            height: 30,
          ),
          PostWidget(),
          SizedBox(
            height: 30,
          ),
          PostWidget(),
        ],
      ),
    );
  }
}
