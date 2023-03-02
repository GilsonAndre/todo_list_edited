import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Tarefas'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded (
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Adicione uma Tarefa'),
                            hintText: 'Ex:. Estudar Flutter',                 
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      ElevatedButton( 
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: const Icon(Icons.add,size: 30),
                         onPressed: (){},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Flexible(
                    child: ListView(
                      children: [
                        
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    children: [
                      const Expanded(child: Text('Você possui 0 tarefas pendentes')),

                      ElevatedButton(
                        onPressed: (){},
                         style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0)
                         ),
                        child: const Text('Limpar Tudo',)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}