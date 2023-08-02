import 'package:us_stock/data/data_source/local/company_listing_entity.dart';
import 'package:us_stock/domain/model/company_listing.dart';

extension ToCompanyListing on CompanyListingEntity {
  CompanyListing toCompanyListing() {
    return CompanyListing(
      symbol: symbol,
      name: name,
      exchange: exchange,
      assetType: assetType,
    );
  }
}

extension ToCompanyListingEntity on CompanyListing {
  CompanyListingEntity toCompanyListingEntity() {
    return CompanyListingEntity(
      symbol: symbol,
      name: name,
      exchange: exchange,
      assetType: assetType,
    );
  }
}
