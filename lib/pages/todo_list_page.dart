import 'package:flutter/material.dart';
import 'package:todo_list_edited/widgets/todo_list_item.dart';

import '../models/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController textController = TextEditingController();

  List<Todo> todos = [];

  Todo? deletedTodo;  
  int? deletedTodoPosition;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      Expanded (
                        child: TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Adicione uma Tarefa'),
                            hintText: 'Ex:. Estudar Flutter',                 
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      //botão pega oq foi escrito no textfield e adicona em uma variavel local 
                      ElevatedButton( 
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: const Icon(Icons.add,size: 30),
                        onPressed: (){
                          String text = textController.text;
                          setState(() {
                            //cria uma nova estancia da classe todo pra setar o que vai ser colocado 
                            Todo newTodo = Todo(
                              title: text, 
                              dateTime: DateTime.now()
                            );
                            todos.add(newTodo);
                          });
                          //Limpa o textfield pra facilitar para o usuario 
                          textController.clear();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  //pega um elemento de cada vez e coloca no widget que eu criei
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for(Todo element in todos)
                          TodoListItem(
                            todo: element,
                            onDeleted: onDeleted,
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20.0,),
                  Row(
                    children: [
                      //Texto que mostra suas tarefas
                      Expanded(
                        child: Text('Você possui ${todos.length} tarefas pendentes'),
                      ),
                      //Botão responsavel por apagar tudo
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            todos.clear();
                          });
                        },
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
    );
  }
  void onDeleted(Todo todo){
    deletedTodo = todo;
    deletedTodoPosition = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('A tarefa ${todo.title} foi deletada'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed:(){
            setState(() {
              todos.insert(deletedTodoPosition!, todo);
            });
          },
        ),
      ),
    );
  }
}