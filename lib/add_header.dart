import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budou/providers.dart';
import 'package:budou/model.dart';


class AddHeader extends ConsumerWidget{
  const AddHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<ToDo> todolist = ref.watch(todosProvider);

    return InkWell(
      onTap: ()=> showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            String description = '';
            bool isCompleted = false;
            return Consumer(
              builder: (context, ref, _){
                return AlertDialog(
                  title:  Text('タスクの追加'),
                  content: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value){
                            description = value;
                          },
                          decoration:  InputDecoration(labelText: 'タスク名', border: OutlineInputBorder()),
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        ref.read(todosProvider.notifier).addTodo(
                            ToDo(id: todolist.length + 1, description: description, isCompleted: isCompleted, key: (todolist.length + 1).toString())
                        );
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
      ),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.add),
          title: Text('タスクを追加'),
        ),
      ),
    );
  }
}