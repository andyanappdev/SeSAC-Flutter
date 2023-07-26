import 'package:get_it_practice/data/counter.dart';
import 'package:get_it_practice/data/counter_repository.dart';
import 'package:get_it_practice/di/di_setup.dart';
import 'package:get_it_practice/ui/main/main_screen.dart';
import 'package:get_it_practice/ui/main/main_view_model.dart';
import 'package:get_it_practice/ui/second/second_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(getIt<CounterRepository>()),
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(getIt<CounterRepository>()),
          child: const SecondScreen(),
        );
      },
    ),
  ],
);
