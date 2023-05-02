part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(
      todos: [
        Todo(id: '1',
          desc: 'First TODO by Default',
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)
          ],),
        Todo(id: '2', desc: 'Second TODO by Default', color: Colors.primaries[
        Random().nextInt(Colors.primaries.length)
        ],),
        Todo(
          id: '3',
          desc: 'Third TODO by Default',
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)
          ],),
      ],
    );
  }

  final List<Todo> todos;

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodoListState(todos: $todos)';

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
