import 'package:hive/hive.dart';
import 'package:us_stock/data/data_source/local/company_listing_entity.dart';

class StockDao {
  static const companyListing = 'companyListing';

  // 추가
  Future<void> insertCompanyListings(
      List<CompanyListingEntity> companyListingEntities) async {
    // box open ('stock.db 이름을 가진 Hive Box(DB) 생성)
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.addAll(companyListingEntities);
  }

  // 클리어
  Future<void> clearCompanyListings() async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.clear();
  }

  // 검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    final List<CompanyListingEntity> companyListing = box.values.toList();
    return companyListing
        .where((e) =>
            e.name.toLowerCase().contains(query.toLowerCase()) ||
            e.symbol.toLowerCase() == e.symbol)
        .toList();
  }
}
