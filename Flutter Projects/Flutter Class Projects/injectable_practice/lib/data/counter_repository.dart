import 'package:injectable_practice/data/counter.dart';

abstract interface class CounterRepository {
  Counter getCounter();
}
