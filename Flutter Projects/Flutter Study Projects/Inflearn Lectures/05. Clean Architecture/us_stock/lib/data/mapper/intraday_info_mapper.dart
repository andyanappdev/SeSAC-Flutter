import 'package:intl/intl.dart';
import 'package:us_stock/data/data_source/remote/intraday_info_dto.dart';
import 'package:us_stock/domain/model/intraday_info.dart';

extension ToIntradayInfo on IntradayInfoDto {
  IntradayInfo toIntradayInfo() {
    // 2023-08-04 19:55:00
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return IntradayInfo(
      date: formatter.parse(timestamp),
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
    );
  }
}
