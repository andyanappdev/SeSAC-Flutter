import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'company_listings_event.freezed.dart';

@freezed
sealed class CompanyListingsEvent with _$CompanyListingsEvent {
  const factory CompanyListingsEvent.refresh() = Refresh;
  const factory CompanyListingsEvent.searchQueryChange(String query) =
      SearchQueryChange;
}
