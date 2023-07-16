import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';

import '../main.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _textContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a ToDo'),
        actions: [
          IconButton(
            onPressed: () async {
              await todos.add(Todo(
                title: _textContorller.text,
                dateTime: DateTime.now().millisecondsSinceEpoch,
              ));
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textContorller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: 'Type Your ToDo',
            hintStyle: TextStyle(color: Colors.grey[800]),
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
