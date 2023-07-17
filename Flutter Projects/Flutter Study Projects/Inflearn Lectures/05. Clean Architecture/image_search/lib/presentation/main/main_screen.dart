import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/presentation/main/components/photo_widget.dart';
import 'package:image_search/presentation/main/main_ui_event.dart';
import 'package:image_search/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();
  // viewModel.eventStream.listen 은 StreamSubscription을 리턴한다
  // 계속해서 listen을 하지 못하도록 처리하기 위해 dispose() 함수 내에서 cancel 해준다
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    // 약간의 딜레이를 주는 microtask
    Future.microtask(() {
      final viewModel = context.read<MainViewModel>();
      viewModel.eventStream.listen((event) {
        switch (event) {
          case ShowSnackBar(:final data):
            // snackbar를 띄워주는 코드 작성
            final snackBar = SnackBar(content: Text(data));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
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
          topSection(viewModel),
          bottomSection(viewModel),
        ],
      ),
    );
  }

  Padding topSection(MainViewModel viewModel) {
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
              viewModel.fetch(_controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Expanded bottomSection(MainViewModel viewModel) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: viewModel.photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final photo = viewModel.photos[index];
          return PhotoWidget(
            photo: photo,
          );
        },
      ),
    );
  }
}
