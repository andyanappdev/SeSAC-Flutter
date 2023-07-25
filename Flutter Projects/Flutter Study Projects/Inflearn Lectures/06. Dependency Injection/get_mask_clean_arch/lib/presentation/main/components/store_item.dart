import 'package:flutter/material.dart';
import 'package:get_mask_clean_arch/domain/model/store.dart';

class StoreItem extends StatelessWidget {
  final Store store;

  const StoreItem({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              store.name,
            ),
            Text(
              store.address,
            ),
            Text(
              '${store.distance / 1000.0}Km',
            ),
          ],
        ),
        Column(
          children: [
            Text(
              store.remainStatus,
            ),
            Text(
              '몇개이상',
            ),
          ],
        ),
      ],
    );
  }
}
