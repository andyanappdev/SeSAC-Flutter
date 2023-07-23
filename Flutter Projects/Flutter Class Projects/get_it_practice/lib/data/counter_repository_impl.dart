import 'package:get_it_practice/data/counter.dart';
import 'package:get_it_practice/data/counter_repository.dart';

class CounterRepositoryImply implements CounterRepository {
  final Counter counter;

  CounterRepositoryImply(this.counter);

  @override
  Counter getCounter() {
    return counter;
  }
}
