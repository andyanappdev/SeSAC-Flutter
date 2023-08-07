import 'package:csv/csv.dart';
import 'package:us_stock/data/csv/csv_parser.dart';
import 'package:us_stock/data/data_source/remote/intraday_info_dto.dart';
import 'package:us_stock/data/mapper/intraday_info_mapper.dart';
import 'package:us_stock/domain/model/intraday_info.dart';

class IntradayInfoParser implements CsvParser<IntradayInfo> {
  @override
  Future<List<IntradayInfo>> parse(String csvString) async {
    List<List<dynamic>> csvValues =
        const CsvToListConverter().convert(csvString);
    csvValues.removeAt(0);
    return csvValues.map((e) {
      final timestamp = e[0] ?? '';
      final open = e[1] ?? 0.0;
      final high = e[2] ?? 0.0;
      final low = e[3] ?? 0.0;
      final close = e[4] ?? 0.0;
      final volume = e[5] ?? 0;
      final dto = IntradayInfoDto(
          timestamp: timestamp,
          open: open,
          high: high,
          low: low,
          close: close,
          volume: volume);
      return dto.toIntradayInfo();
    }).toList();
  }
}
