import 'package:flutter/material.dart';
import 'package:get_mask_clean_arch/data/mock_datas.dart';
import 'package:get_mask_clean_arch/domain/use_case/get_near_by_stores_use_case.dart';
import 'package:get_mask_clean_arch/presentation/main/main_screen.dart';
import 'package:get_mask_clean_arch/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

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
        create: (BuildContext context) {
          return MainViewModel(
            GetNearByStoresUseCase(
              storeRepository: MockStoreRepositoryImpl(),
              locationRepository: MockLocationRepositoryImpl(),
              locationPermissionHandler: MockLocationPermissionHandler(),
            ),
          );
        },
        child: const MainScreen(),
      ),
    );
  }
}
