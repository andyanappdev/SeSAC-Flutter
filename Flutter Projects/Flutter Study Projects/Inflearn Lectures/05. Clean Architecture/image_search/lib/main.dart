import 'package:flutter/material.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/presentation/main/main_screen.dart';
import 'package:image_search/presentation/main/main_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PhotoProvider(
        viewModel: MainViewModel(PixabayApi()),
        child: const MainScreen(),
      ),
    );
  }
}

/// 참고 source : https://github.com/junsuk5/flutter-clean-architecture-course/tree/master/image-search-app
