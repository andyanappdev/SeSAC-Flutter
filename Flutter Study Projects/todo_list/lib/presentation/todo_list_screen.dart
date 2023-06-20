import 'package:flutter/material.dart';
import 'package:todo_list/presentation/create_screen.dart';
import '../main.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  // dummy data
  // List<Todo> todos = [
  //   Todo(title: '할일1', dateTime: 12342),
  //   Todo(title: '할일2', dateTime: 4567),
  //   Todo(title: '할일3', dateTime: 890),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: ListView(
          children: todos.values
              .map((todo) => ListTile(
                    title: Text(todo.title),
                    subtitle: Text('${todo.dateTime}'),
                  ))
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // awiat 를 사용하여 CreateScreen으로 이동하여 todo를 입력하고 돌아오는 것을 기다리게 한다.
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );

          setState(() {}); // 화면 갱신
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
