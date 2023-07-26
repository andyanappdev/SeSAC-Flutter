import 'package:flutter/material.dart';
import 'package:get_mask_clean_arch/di/di_setup.dart';
import 'package:get_mask_clean_arch/presentation/main/main_screen.dart';
import 'package:get_mask_clean_arch/presentation/main/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => ChangeNotifierProvider(
        create: (BuildContext context) => getIt<MainViewModel>(),
        child: const MainScreen(),
      ),
    ),
  ],
);
