import 'package:bmi_go_router/main/main_screen.dart';
import 'package:bmi_go_router/result/result_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
            // 라우터 내부에 라우터를 구성할 경우
            // path에 전체 경로를 작성하는 것이 아니라, 상위 경로는 생략하고 작성
            path: 'result',
            builder: (context, state) {
              double height = double.parse(state.queryParameters['height']!);
              double weight = double.parse(state.queryParameters['weight']!);
              return ResultScreen(height: height, weight: weight);
            }),
      ],
    ),
    // GoRoute(
    //     // path 작성시 이동하는 전체 경로를 차례대로 나열해서 작성해 주어야 한다.
    //     path: 'main/result',
    //     builder: (context, state) {
    //       double height = double.parse(state.queryParameters['height']!);
    //       double weight = double.parse(state.queryParameters['weight']!);
    //       return ResultScreen(height: height, weight: weight);
    //     }),
  ],
);
