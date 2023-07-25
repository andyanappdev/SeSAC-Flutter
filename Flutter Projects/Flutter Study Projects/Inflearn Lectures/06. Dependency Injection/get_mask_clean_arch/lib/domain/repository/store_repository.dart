import 'package:get_mask_clean_arch/domain/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}
