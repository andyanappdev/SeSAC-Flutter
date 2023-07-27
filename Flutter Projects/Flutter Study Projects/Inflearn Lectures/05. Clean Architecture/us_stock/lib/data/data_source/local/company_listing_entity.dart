import 'package:hive/hive.dart';

part 'company_listing_entity.g.dart';

@HiveType(typeId: 0)
class CompanyListingEntity extends HiveObject {
  @HiveField(0)
  String symbol;

  @HiveField(1)
  String name;

  @HiveField(2)
  String exchange;

  @HiveField(3)
  String assetType;

  CompanyListingEntity({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
  });
}
