import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'company_info.freezed.dart';

part 'company_info.g.dart';

@freezed
class CompanyInfo with _$CompanyInfo {
  const factory CompanyInfo({
    required String symbol,
    required String assetType,
    required String name,
    required String description,
    required String exchange,
    required String country,
    required String sector,
    required String industry,
    required String marketCapitalization, // 시가총액
    required String per, // 주가수익비율
    required String eps, // 주당순이익
    required String weekHigh,
    required String weekLow,
  }) = _CompanyInfo;

  factory CompanyInfo.fromJson(Map<String, Object?> json) =>
      _$CompanyInfoFromJson(json);
}
