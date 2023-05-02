import 'dart:async';

import 'package:ampcome_practical_app/counter/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:ampcome_practical_app/counter/cubit/todo_list/todo_list_cubit.dart';
import 'package:ampcome_practical_app/counter/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;

  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoListSubscription;

   final List<Todo> initialTodoList;

  FilteredTodosCubit({
    required this.initialTodoList,
    required this.todoListCubit,
    required this.todoFilterCubit,
   }) : super(FilteredTodosState(filteredTodos: initialTodoList)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
       setFilteredTodos();
    });
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
       setFilteredTodos();
    });
  }

   void setFilteredTodos() {
    List<Todo> filteredTodos;
    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todos
            .where((element) => !element.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListCubit.state.todos
            .where((element) => element.completed)
            .toList();
        break;
      case Filter.all:

      default:
        filteredTodos = todoListCubit.state.todos;
        break;
    }
     emit(state.copyWith(filteredTodos: filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
