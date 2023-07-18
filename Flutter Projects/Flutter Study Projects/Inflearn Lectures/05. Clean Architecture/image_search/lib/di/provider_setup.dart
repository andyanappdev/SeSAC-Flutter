import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';
import 'package:image_search/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

/// 2. 의존성이 전혀 없는 독립적인 객체
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  )
];

/// 3. 2번에 의존성이 있는 객체 (2번과 엮이는 객체 (2번이 필요한 아이들))
List<SingleChildWidget> dependentModels = [
  //           의존하는 타입(받아오는), 만들어져서 return 하는 타입
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) => PhotoApiRepositoryImpl(api),
  ),
  ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
    update: (context, repository, _) => GetPhotosUseCase(repository),
  ),
];

// 4. ViewModels
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<MainViewModel>(
    create: (context) => MainViewModel(context.read<GetPhotosUseCase>()),
  ),
];
