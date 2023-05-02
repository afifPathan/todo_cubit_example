import 'dart:math';

import 'package:ampcome_practical_app/counter/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String todoDesc) {
    final newTodo = Todo(
      desc: todoDesc,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      id: DateTime.now().microsecondsSinceEpoch.toString(),
    );
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(String id) {
    final newTodos = state.todos.where((element) => element.id != id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
