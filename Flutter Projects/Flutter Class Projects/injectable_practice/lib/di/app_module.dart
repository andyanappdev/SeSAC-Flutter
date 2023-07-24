import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @prod
  @lazySingleton
  String get appTitle => 'First Scree (정식 버전)';
}

@module
abstract class AppDebugModule {
  @dev
  @lazySingleton
  String get appTile => 'First Screen (개발 버전)';
}
