import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({required this.title,super.key});

  final String title;
  
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
          const Text('14/02/199', style: TextStyle(fontSize: 12),),
          Text(title ,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}