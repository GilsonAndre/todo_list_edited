import 'package:flutter/material.dart';
import 'package:todo_list_edited/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController textController = TextEditingController();

  List<String> todos = [];


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
                            todos.add(text);
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
                        for(String element in todos)
                          TodoListItem(title: element)
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
      ),
    );
  }
}