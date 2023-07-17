import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/presentation/main/main_screen.dart';
import 'package:image_search/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
      home: ChangeNotifierProvider(
        create: (_) =>
            MainViewModel(PhotoApiRepositoryImpl(PixabayApi(http.Client()))),
        child: const MainScreen(),
      ),
    );
  }
}

/// 참고 source : https://github.com/junsuk5/flutter-clean-architecture-course/tree/master/image-search-app
