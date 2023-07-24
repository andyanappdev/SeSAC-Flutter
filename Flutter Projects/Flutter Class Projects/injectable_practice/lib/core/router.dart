import 'package:go_router/go_router.dart';
import 'package:injectable_practice/ui/main/main_screen.dart';
import 'package:injectable_practice/ui/main/main_view_model.dart';
import 'package:injectable_practice/ui/second/second_screen.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const SecondScreen(),
        );
      },
    ),
  ],
);
