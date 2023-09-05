import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/data/data_source/local/company_listing_entity.dart';
import 'package:us_stock/data/data_source/local/stock_dao.dart';
import 'package:us_stock/data/data_source/remote/stock_api.dart';
import 'package:us_stock/data/repository/stock_repository_impl.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_listings/company_listings_screen.dart';
import 'package:us_stock/presentation/company_listings/company_listings_view_model.dart';
import 'package:us_stock/util/color_schemes.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializes Hive with a valid directory in your app files.
  await Hive.initFlutter();
  // Register Adapter
  Hive.registerAdapter(CompanyListingEntityAdapter());

  await dotenv.load(fileName: '.env');

  final repository = StockRepositoryImpl(StockApi(), StockDao());

  GetIt.instance.registerSingleton<StockRepository>(repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => CompanyListingsViewModel(repository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const CompanyListingsScreen(),
    );
  }
}

/// 참고 source : https://github.com/junsuk5/flutter-stock-app-course
