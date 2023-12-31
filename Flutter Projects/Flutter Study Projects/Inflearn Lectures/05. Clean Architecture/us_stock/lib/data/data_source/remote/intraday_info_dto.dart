import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'intraday_info_dto.freezed.dart';

part 'intraday_info_dto.g.dart';

@freezed
class IntradayInfoDto with _$IntradayInfoDto {
  const factory IntradayInfoDto({
    required String timestamp,
    required double open,
    required double high,
    required double low,
    required double close,
    required int volume,
  }) = _IntradayInfoDto;

  factory IntradayInfoDto.fromJson(Map<String, Object?> json) =>
      _$IntradayInfoDtoFromJson(json);
}
