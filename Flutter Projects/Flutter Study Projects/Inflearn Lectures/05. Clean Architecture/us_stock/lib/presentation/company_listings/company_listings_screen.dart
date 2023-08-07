import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_info/company_info_screen.dart';
import 'package:us_stock/presentation/company_info/company_info_view_model.dart';
import 'package:us_stock/presentation/company_listings/company_listings_event.dart';
import 'package:us_stock/presentation/company_listings/company_listings_state.dart';
import 'package:us_stock/presentation/company_listings/company_listings_view_model.dart';

class CompanyListingsScreen extends StatelessWidget {
  const CompanyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyListingsViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topSection(context, viewModel),
            listViewSection(state, viewModel),
          ],
        ),
      ),
    );
  }

  Widget topSection(BuildContext context, viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (query) {
          viewModel.onEvent(CompanyListingsEvent.searchQueryChange(query));
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          labelText: 'Search...',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }

  Widget listViewSection(CompanyListingsState state, viewModel) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          viewModel.onEvent(const CompanyListingsEvent.refresh());
        },
        child: ListView.builder(
            itemCount: state.companies.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(state.companies[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          final repository = GetIt.instance<StockRepository>();
                          final symbol = state.companies[index].symbol;
                          return ChangeNotifierProvider(
                            create: (_) =>
                                CompanyInfoViewModel(repository, symbol),
                            child: const CompanyInfoScreen(),
                          );
                        }),
                      );
                    },
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
