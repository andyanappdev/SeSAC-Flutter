import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_setup.config.dart';

final getIt = GetIt.instance;

const prod = Environment('proc');
const dev = Environment('dev');

@InjectableInit()
void configureDependencies() => getIt.init(environment: Environment.prod);
