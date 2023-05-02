import 'dart:async';

import 'package:ampcome_practical_app/counter/cubit/todo_list/todo_list_cubit.dart';
import 'package:ampcome_practical_app/counter/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoLisState) {
      final currentActiveTodoCount = todoLisState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;
      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));
    });
  }

  late final StreamSubscription todoListSubscription;
  final int initialActiveTodoCount;
  final TodoListCubit todoListCubit;

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
