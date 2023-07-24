import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  String get appTitle => 'First Scree (정식 버전)';
}
