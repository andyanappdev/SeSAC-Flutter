import 'package:flutter/cupertino.dart';
import 'package:injectable_practice/data/counter_repository.dart';

class MainViewModel with ChangeNotifier {
  final CounterRepository counterRepository;

  MainViewModel(this.counterRepository);
  int get count => counterRepository.getCounter().count;

  void increment() {
    counterRepository.getCounter().count++;
    notifyListeners();
  }
}
