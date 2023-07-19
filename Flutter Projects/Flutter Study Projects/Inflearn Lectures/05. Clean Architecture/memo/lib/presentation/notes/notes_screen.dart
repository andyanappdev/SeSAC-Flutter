import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Note'),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.sort),
          )
        ],
        elevation: 0.0,
      ),
      body: Container(),
    );
  }
}
