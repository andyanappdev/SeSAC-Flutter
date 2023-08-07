import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/domain/model/company_info.dart';
import 'package:us_stock/presentation/company_info/company_info_view_model.dart';

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

  Widget _buildBody(BuildContext context, state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            state.companyInfo.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            state.companyInfo.symbol,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          Divider(color: Theme.of(context).colorScheme.outline),
          Text(
            'Industry: ${state.companyInfo.industry}',
            maxLines: 2,
          ),
          Text('Country: ${state.companyInfo.country}'),
          Divider(color: Theme.of(context).colorScheme.outline),
          Text(
            state.companyInfo.description,
            style: const TextStyle(
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
