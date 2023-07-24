import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable_practice/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainScreen'),
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
