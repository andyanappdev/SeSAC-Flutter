import 'package:flutter/material.dart';
import 'package:get_it_practice/ui/main/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Text(
          '${viewModel.count}',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<MainViewModel>().increment();
            },
            child: const Text('+'),
          ),
          FloatingActionButton(
            onPressed: () {
              context.push('/second');
            },
            child: const Text(
              'Next Screen',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
