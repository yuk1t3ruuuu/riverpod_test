import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budou/providers.dart';
import 'package:budou/model.dart';




void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoPage(),
    );
  }
}

class ToDoPage extends ConsumerWidget{
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){

    final List<ToDo> todolist = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDoリスト'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: ReorderableListView(
            onReorder: ( oldIndex,  newIndex){
              ref.read(todosProvider.notifier).drag(oldIndex, newIndex);
            },
            children: todolist.map((todo) =>
                Card(
                    key: Key(todo.key),
                    child: ListTile(
                      title: Text('${todo.description}'),
                    )
                )).toList()
        ),
      ),
    );
  }





}

