import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/todo.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap; // callback 함수
  final Function(Todo) onDelete; // callback 함수

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      leading: todo.isDone == true
          ? const Icon(Icons.check_box, color: Colors.green)
          : const Icon(Icons.square_outlined),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
        DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(todo.dateTime)),
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              onTap: () {
                onDelete(todo);
              },
              child: const Icon(Icons.delete_forever),
            )
          : null,
    );
  }
}
