import 'package:hive/hive.dart';
import 'package:us_stock/data/data_source/local/company_listing_entity.dart';

/// Local DB (Hive)에 접근하는 DAO
class StockDao {
  /// Hive에 추가
  Future<void> insertCompanyListings(
      List<CompanyListingEntity> companyListingEntities) async {
    // box open ('stock.db 이름을 가진 Hive Box(DB)를 사용하기 위해 open)
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.addAll(companyListingEntities);
  }

  /// Hive에 저장된 data Clear
  Future<void> clearCompanyListings() async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.clear();
  }

  /// Hive 내의 data Search
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    final List<CompanyListingEntity> companyListing = box.values.toList();
    return companyListing
        .where((e) =>
            e.name.toLowerCase().contains(query.toLowerCase()) ||
            e.symbol == query.toUpperCase())
        .toList();
  }
}
