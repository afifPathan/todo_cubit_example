import 'package:ampcome_practical_app/counter/cubit/filtered_todos/filtered_todos_cubit.dart';
import 'package:ampcome_practical_app/counter/cubit/todo_list/todo_list_cubit.dart';
import 'package:ampcome_practical_app/counter/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: todos.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(todos[index].id),
        background: showBackground(0), //swipe  a dx
        secondaryBackground: showBackground(1), //swipe a sin
        onDismissed: (direction) {
          context.read<TodoListCubit>().removeTodo(todos[index].id);
        },
        confirmDismiss: (direction) {
          return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you really want to delete this Todo?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('NO'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('SURE'),
                  ),
                ],
              );
            },
          );
        },
        child: TodoItem(
          todo: todos[index],
        ),
      ),
    );
  }

   Widget showBackground(int direction) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}

class TodoItem extends StatefulWidget {

  const TodoItem({
    super.key,
    required this.todo,
  });
  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor : widget.todo.color,
      title: Text(
        widget.todo.desc,
        style: const TextStyle(fontSize: 24,color: Colors.white),
      ),
    );
  }
}
