import 'package:image_search/domain/model/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState(
    List<Photo> photos,
    bool isLoading,
  ) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) =>
      _$MainStateFromJson(json);
}

/// 수동으로 State class 생성
// class MainState {
//   final List<Photo> photos;
//   final bool isLoading;
//
//   MainState({
//     required this.photos,
//     required this.isLoading,
//   });
//
//   // deepCopy
//   MainState copy({List<Photo>? photos, bool? isLoading}) {
//     return MainState(
//       photos: photos ?? this.photos,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }
