import 'package:go_router/go_router.dart';
import 'package:provider_practice/presentation/main/main_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
    // GoRoute(
    //   path: '/second',
    //   builder: (context, state) => SecondScreen(),
    // ),
  ],
);
