import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'main_ui_event.freezed.dart';

@freezed
sealed class MainUiEvent<T> with _$MainUiEvent<T> {
  const factory MainUiEvent.showSnackBar(T data) = ShowSnackBar;
}
