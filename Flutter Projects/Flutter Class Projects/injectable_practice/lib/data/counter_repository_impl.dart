import 'package:injectable_practice/data/counter.dart';
import 'package:injectable_practice/data/counter_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CounterRepository)
class CounterRepositoryImply implements CounterRepository {
  final Counter counter;

  CounterRepositoryImply(this.counter);

  @override
  Counter getCounter() {
    return counter;
  }
}
