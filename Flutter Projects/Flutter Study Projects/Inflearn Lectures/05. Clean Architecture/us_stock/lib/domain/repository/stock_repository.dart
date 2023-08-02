import 'package:us_stock/domain/model/company_listing.dart';
import 'package:us_stock/util/result.dart';

abstract class StockRepository {
  Future<Result<List<CompanyListing>>> getCompanyListing(
    bool fetchFromRemote,
    String query,
  );
}
