import 'package:get_mask_clean_arch/data/data_source/local/mock_datas.dart';
import 'package:get_mask_clean_arch/domain/use_case/get_near_by_stores_use_case.dart';
import 'package:test/test.dart';

void main() {
  final useCase = GetNearByStoresUseCase(
    storeRepository: MockStoreRepositoryImpl(),
    locationRepository: MockLocationRepositoryImpl(),
    locationPermissionHandler: MockLocationPermissionHandler(),
  );

  test('약국 정보가 가까운 순서대로 오름차순 정렬', () async {
    final stores = await useCase.execute();

    expect(stores[0].name, '자곡약국');
    expect(stores[1].name, '세곡약국');
    expect(stores[2].name, '수서약국');
  });
}
