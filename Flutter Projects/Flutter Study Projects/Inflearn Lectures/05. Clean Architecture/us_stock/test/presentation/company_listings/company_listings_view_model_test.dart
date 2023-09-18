import 'package:hive/hive.dart';
import 'package:test/test.dart';
import 'package:us_stock/data/data_source/local/stock_dao.dart';
import 'package:us_stock/data/data_source/remote/stock_api.dart';
import 'package:us_stock/data/repository/stock_repository_impl.dart';
import 'package:us_stock/presentation/company_listings/company_listings_view_model.dart';

void main() {
  test('CompanyListingsViewModel 생성시 데이터를 잘 가져와야 한다', () async {
    //todo : Test code 완성하기
    final _api = StockApi();
    final _dao = StockDao();
    final viewModel = CompanyListingsViewModel(StockRepositoryImpl(_api, _dao));

    await Future.delayed(const Duration(seconds: 3));

    expect(viewModel.state.companies.isNotEmpty, true);
  });
}
