import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../models/todo.dart';


class TodoListItem extends StatelessWidget {
  const TodoListItem({required this. onDeleted, required this.todo,super.key});

  final Todo todo;
  final Function(Todo) onDeleted;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(), 
          extentRatio: 0.3,
          children: [
            SlidableAction(
              onPressed:(context) => onDeleted(todo),
              label: 'Deletar',
              icon: Icons.delete,
              backgroundColor: Colors.transparent,
            ),
          ]
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0,),
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MMM/yyyy - HH:mm').format(todo.dateTime),
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              Text(
                todo.title ,
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}