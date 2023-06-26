import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/domain/model/create_model.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final CreateModel model = CreateModel();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Post'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: 'Type in Title of the Post',
                  fillColor: Colors.white70,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  _image = await model.getImage();
                  // 화면 갱신
                  setState(() {});
                },
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 10),
              if (_image != null)
                Image.file(
                  _image!,
                  // width: 300,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
