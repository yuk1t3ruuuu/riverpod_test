import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budou/model.dart';

List<ToDo> todolist = [
  ToDo(id: 0, description: 'タスク1', isCompleted: false, key: '1'),
  ToDo(id: 1, description: 'タスク2', isCompleted: false, key: '2'),
  ToDo(id: 2, description: 'タスク3', isCompleted: false, key: '3'),
  ToDo(id: 3, description: 'タスク4', isCompleted: false, key: '4')
];

class TodoNotifier extends StateNotifier<List<ToDo>> {
  TodoNotifier() : super(todolist);

  void addTodo(ToDo todo) {
    state = [...state, todo];
  }

  void removeTodo(int id) {
    state = [
      for(final todo in state)
        if(todo.id != id) todo
    ];
  }

  void toggle(int id) {
    state = [
      for(final todo in state)
        if(todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }

  void drag (int oldIndex, int newIndex){
    List<ToDo> index = [];
    if (oldIndex < newIndex){
      newIndex -= 1;
    }
    ToDo num = state.removeAt(oldIndex);
    state.insert(newIndex, num);
    index.addAll(state);
    state = index;
  }


}

  final todosProvider = StateNotifierProvider<TodoNotifier, List<ToDo>>((ref) {
    return TodoNotifier();
  });



