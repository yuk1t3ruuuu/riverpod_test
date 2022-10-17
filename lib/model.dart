import 'package:flutter/material.dart';

@immutable
class ToDo{
  const ToDo({
    required this.id,
    required this.description,
    required this.isCompleted,
    required this.key
});

  final int id;
  final String description;
  final bool isCompleted;
  final String key;

  ToDo copyWith({int? id, String? description, bool? isCompleted, String? key }) {
    return ToDo(
        id: id?? this.id,
        description: description?? this.description,
        isCompleted: isCompleted?? this.isCompleted,
        key: key?? this.key
    );
  }
}