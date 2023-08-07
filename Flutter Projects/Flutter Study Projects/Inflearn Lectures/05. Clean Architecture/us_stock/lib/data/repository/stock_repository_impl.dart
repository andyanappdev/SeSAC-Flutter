import 'dart:convert';

import 'package:us_stock/data/csv/company_listing_parser.dart';
import 'package:us_stock/data/data_source/local/company_listing_entity.dart';
import 'package:us_stock/data/data_source/local/stock_dao.dart';
import 'package:us_stock/data/data_source/remote/company_info_dto.dart';
import 'package:us_stock/data/data_source/remote/stock_api.dart';
import 'package:us_stock/data/mapper/company_mapper.dart';
import 'package:us_stock/domain/model/company_info.dart';
import 'package:us_stock/domain/model/company_listing.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/util/result.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApi _api;
  final StockDao _dao;
  final _parser = CompanyListingParser();

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
      final response = await _api.getListings();
      final remoteListings = await _parser.parse(response.body);

      // 기존에 있던 cache를 비워주고 (비워주는 작업이 없으면 계속해서 add 되기 때문)
      await _dao.clearCompanyListings();
      // 리모트에서 가져온 데이터를 cache에 추가
      await _dao.insertCompanyListings(
          remoteListings.map((e) => e.toCompanyListingEntity()).toList());

      return Result.success(remoteListings);
    } catch (e) {
      return Result.error(Exception('failed data load from Remote'));
    }
  }

  @override
  Future<Result<CompanyInfo>> getCompanyInfo(String symbol) async {
    try {
      final response = await _api.getCompanyInfo(symbol: symbol);
      final companyInfoDto = CompanyInfoDto.fromJson(jsonDecode(response.body));
      return Result.success(companyInfoDto.toCompanyInfo());
    } catch (e) {
      return Result.error(
          Exception('Failed Load Company Info: ${e.toString()}'));
    }
  }
}
