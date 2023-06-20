import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0) // hive를 이용하여 저장할 객체에 annotation 달기
class Todo extends HiveObject {
  // HiveObject 상속
  @HiveField(0) // field에도 annotation 달기
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int dateTime;

  Todo({required this.title, required this.dateTime});
}
