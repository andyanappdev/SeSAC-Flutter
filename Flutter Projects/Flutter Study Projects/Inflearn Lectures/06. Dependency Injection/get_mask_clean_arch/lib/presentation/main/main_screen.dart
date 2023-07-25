import 'package:flutter/material.dart';
import 'package:get_mask_clean_arch/presentation/main/components/store_item.dart';
import 'package:get_mask_clean_arch/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title:
            Text('List of pharmacies stocking masks: ${state.stores.length}곳'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children:
                  state.stores.map((store) => StoreItem(store: store)).toList(),
            ),
    );
  }
}
