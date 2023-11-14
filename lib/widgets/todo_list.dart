import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Map<String, dynamic>> todos = [
    {"text": "hello"},
    {"text": "world"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: "Todo"),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: todos.map((todo) {
              return Text(todo["text"]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
