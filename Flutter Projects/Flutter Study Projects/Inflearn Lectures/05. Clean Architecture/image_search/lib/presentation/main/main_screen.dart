import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/components/photo_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();

  List<Photo> _photos = [];

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=38286837-4dd42efa00b62bbc0137718e6&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Search App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        elevation: 0.0, // appbar 그림자 제거
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    // 클릭시 작동 코드 작성
                    final photos = await fetch(_controller.text);
                    setState(() {
                      _photos = photos;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisExtent: 16,
              ),
              itemBuilder: (context, index) {
                final photo = _photos[index];
                return PhotoWidget(
                  photo: photo,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
