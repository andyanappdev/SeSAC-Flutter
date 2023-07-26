import 'package:get_mask_clean_arch/data/data_source/remote/store_api.dart';
import 'package:get_mask_clean_arch/domain/model/store.dart';
import 'package:get_mask_clean_arch/domain/repository/store_repository.dart';
import 'package:injectable/injectable.dart';

@prod
@Singleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final _api = StoreApi();

  @override
  Future<List<Store>> getStores() async {
    final result = await _api.getStoreResult();

    if (result == null) {
      return [];
    }

    return result.stores!
        .where((e) {
          return e.remainStat != null && e.stockAt != null;
        })
        .map((e) => Store(
              name: e.name ?? 'No Name',
              address: e.addr ?? 'No Address',
              lat: e.lat ?? 0.0,
              lng: e.lng ?? 0.0,
              remainStatus: e.remainStat!,
            ))
        .toList();
  }
}
