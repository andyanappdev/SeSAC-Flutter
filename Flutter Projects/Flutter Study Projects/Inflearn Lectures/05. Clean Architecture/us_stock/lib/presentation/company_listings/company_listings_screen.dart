import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            topSection(context),
            listViewSection(state),
          ],
        ),
      ),
    );
  }

  Widget topSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          labelText: 'Search...',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }

  Widget listViewSection(CompanyListingsState state) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          // 코드 작성
        },
        child: ListView.builder(
            itemCount: state.companies.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(state.companies[index].name),
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
