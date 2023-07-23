import 'package:get_it/get_it.dart';
import 'package:get_it_practice/data/counter.dart';
import 'package:get_it_practice/data/counter_repository.dart';
import 'package:get_it_practice/data/counter_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // Singleton : 하나의 인스턴스만 존재
  getIt.registerSingleton<Counter>(Counter());

  // Factory : 매번 새로운 인스턴스를 생성
  // getIt.registerFactory<Counter>(() => Counter());

  getIt.registerFactory<CounterRepository>(
      () => CounterRepositoryImply(getIt<Counter>()));
}
