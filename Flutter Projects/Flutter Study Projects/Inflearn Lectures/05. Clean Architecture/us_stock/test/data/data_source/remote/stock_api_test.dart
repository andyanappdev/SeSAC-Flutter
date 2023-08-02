import 'package:test/test.dart';
import 'package:us_stock/data/csv/company_listing_parser.dart';
import 'package:us_stock/data/data_source/remote/stock_api.dart';

void main() {
  test('네트워크 통신', () async {
    // stock api test
    final response = await StockApi().getListings();

    // parser test
    final _parser = CompanyListingParser();
    final remoteListings = await _parser.parse(response.body);

    // 검증
    expect(remoteListings[0].symbol, 'A');
    expect(remoteListings[0].name, 'Agilent Technologies Inc');
    expect(remoteListings[0].exchange, 'NYSE');
    expect(remoteListings[0].assetType, 'Stock');
  });
}
