import 'package:injectable_practice/data/counter.dart';
import 'package:injectable_practice/data/counter_repository.dart';
import 'package:injectable/injectable.dart';

@prod
@Singleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  final Counter counter;

  CounterRepositoryImpl(this.counter);

  @override
  Counter getCounter() {
    return counter;
  }
}

@dev
@Injectable(as: CounterRepository)
class MockCounterRepositoryImpl implements CounterRepository {
  MockCounterRepositoryImpl();

  @override
  Counter getCounter() {
    return Counter();
  }
}
