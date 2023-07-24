import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:memo_refactoring/domain/util/order_type.dart';

part 'note_order.freezed.dart';

@freezed
sealed class NoteOrder with _$NoteOrder {
  const factory NoteOrder.title(OrderType orderType) = NoteOrderTitle;
  const factory NoteOrder.date(OrderType orderType) = NoteOrderdate;
  const factory NoteOrder.color(OrderType orderType) = NoteOrderColor;
}
