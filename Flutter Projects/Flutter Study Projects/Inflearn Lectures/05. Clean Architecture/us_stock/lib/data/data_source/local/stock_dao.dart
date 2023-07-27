import 'package:hive/hive.dart';
import 'package:us_stock/data/data_source/local/company_listing_entity.dart';

class StockDao {
  static const companyListing = 'companyListing';

  // 'stock.db 이름을 가진 Hive Box(DB) 생성
  final box = Hive.box('stock.db');

  // 추가
  Future<void> insertCompanyListings(
      List<CompanyListingEntity> companyListingEntity) async {
    await box.put(StockDao.companyListing, companyListingEntity);
  }

  // 클리어
  Future<void> clearCompanyListings() async {
    await box.clear();
  }

  // 검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final List<CompanyListingEntity> companyListing =
        box.get(StockDao.companyListing, defaultValue: []);
    return companyListing
        .where((e) =>
            e.name.toLowerCase().contains(query.toLowerCase()) ||
            e.symbol.toLowerCase() == e.symbol)
        .toList();
  }
}
