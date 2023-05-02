part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {

  const FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }
  final List<Todo> filteredTodos;

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredTodos)';

  @override
  List<Object> get props => [filteredTodos];

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
