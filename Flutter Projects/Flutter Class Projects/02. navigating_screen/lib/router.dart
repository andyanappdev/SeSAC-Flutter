import 'package:go_router/go_router.dart';
import 'package:navigating_screen/presentation/detail_screen.dart';
import 'package:navigating_screen/presentation/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'detail1',
          builder: (context, state) => const DetailScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/detail2',
      builder: (context, state) => const DetailScreen(),
    ),
  ],
);
