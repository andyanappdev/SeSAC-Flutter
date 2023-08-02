import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:us_stock/data/data_source/local/company_listing_entity.dart';
import 'package:us_stock/util/color_schemes.dart';

void main() {
  // Register Adapter
  Hive.registerAdapter(CompanyListingEntityAdapter());
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
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MainScreen(),
    );
  }
}

/// 참고 source : https://github.com/junsuk5/flutter-stock-app-course
