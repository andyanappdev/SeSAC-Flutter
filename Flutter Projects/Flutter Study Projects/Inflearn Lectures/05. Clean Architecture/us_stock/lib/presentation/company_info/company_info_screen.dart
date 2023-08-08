import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/presentation/company_info/company_info_state.dart';
import 'package:us_stock/presentation/company_info/company_info_view_model.dart';
import 'package:us_stock/presentation/company_info/components/stock_chart.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyInfoViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (state.errorMessage != null)
              Center(child: Text(state.errorMessage!)),
            if (state.isLoading)
              const Center(child: CircularProgressIndicator()),
            if (state.isLoading == false && state.errorMessage == null)
              _buildBody(context, state),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CompanyInfoState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.companyInfo!.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              // color: Theme.of(context).colorScheme.primary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            state.companyInfo!.symbol,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontStyle: FontStyle.italic
                // color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
          Divider(color: Theme.of(context).colorScheme.outline),
          const Text(
            'Industry',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            state.companyInfo!.industry,
            maxLines: 2,
          ),
          Text.rich(
            TextSpan(
              text: 'Country : ', // default text style
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              children: [
                TextSpan(
                  text: state.companyInfo!.country,
                  style: const TextStyle(fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Divider(color: Theme.of(context).colorScheme.outline),
          Text(
            state.companyInfo!.description,
            style: const TextStyle(
              fontSize: 13,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 5,
          ),
          Divider(color: Theme.of(context).colorScheme.outline),
          _chartSection(context, state),
        ],
      ),
    );
  }

  Widget _chartSection(BuildContext context, CompanyInfoState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        if (state.stockInfo.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StockChart(
              info: state.stockInfo,
              graphColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
      ],
    );
  }
}
