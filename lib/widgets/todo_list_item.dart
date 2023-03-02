import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';


class TodoListItem extends StatelessWidget {
  const TodoListItem({required this.todo,super.key});

  final Todo todo;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat.yMMM().format(todo.dateTime),style: const TextStyle(fontSize: 12)),
          Text(todo.title ,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}