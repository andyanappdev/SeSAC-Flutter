import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/core/router.dart';
import 'package:provider_practice/presentation/main/main_view_model.dart';

void main() {
  runApp(const MyApp());
  // App 최상단에 Provider 설정시
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
