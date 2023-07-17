import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/components/photo_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final api = PixabayApi();
  final TextEditingController _controller = TextEditingController();

  List<Photo> _photos = [];

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
          topSection(),
          bottomSection(),
        ],
      ),
    );
  }

  Padding topSection() {
    return Padding(
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
              final photos = await api.fetch(_controller.text);
              setState(() {
                _photos = photos;
              });
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Expanded bottomSection() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final photo = _photos[index];
          return PhotoWidget(
            photo: photo,
          );
        },
      ),
    );
  }
}
