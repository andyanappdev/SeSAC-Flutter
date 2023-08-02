import 'package:us_stock/data/data_source/local/company_listing_entity.dart';
import 'package:us_stock/data/data_source/local/stock_dao.dart';
import 'package:us_stock/data/data_source/remote/stokc_api.dart';
import 'package:us_stock/data/mapper/company_mapper.dart';
import 'package:us_stock/domain/model/company_listing.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/util/result.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApi _api;
  final StockDao _dao;

  StockRepositoryImpl(this._api, this._dao);

  @override
  Future<Result<List<CompanyListing>>> getCompanyListing(
      bool fetchFromRemote, String query) async {
    // 먼저 캐시에서 데이터를 찾는다
    final List<CompanyListingEntity> localListings =
        await _dao.searchCompanyListing(query);

    // 캐시에 없다면 리모트에서 가져온다
    final isDbEmpty = localListings.isEmpty && query.isEmpty;
    final shouldJustLoadFromCache = !isDbEmpty && !fetchFromRemote;
    // 캐시에서 가져오기
    if (shouldJustLoadFromCache) {
      return Result.success(
          localListings.map((e) => e.toCompanyListing()).toList());
    }

    // 리모트에서 가져오기
    try {
      final remoteListings = await _api.getListings();
      // TODO : CSV 파일 파싱하여 변환 코드 필요
      return Result.success([]);
    } catch (e) {
      return Result.error(Exception('failed data load from Remote'));
    }
  }
}
