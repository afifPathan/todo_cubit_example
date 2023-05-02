import 'package:ampcome_practical_app/counter/models/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_filter_state.dart';

class TodoFilterCubit extends Cubit<TodoFilterState> {
  TodoFilterCubit() : super(TodoFilterState.initial());

   void changeFilter(Filter newFilter) {
    emit(state.copyWith(filter: newFilter));
  }
}
