import 'package:image_search/domain/model/photo.dart';

class MainState {
  final List<Photo> photos;
  final bool isLoading;

  MainState({
    required this.photos,
    required this.isLoading,
  });

  // deepCopy
  MainState copy({List<Photo>? photos, bool? isLoading}) {
    return MainState(
      photos: photos ?? this.photos,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
