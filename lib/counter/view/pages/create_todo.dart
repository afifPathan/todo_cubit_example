import 'package:ampcome_practical_app/counter/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:ampcome_practical_app/counter/cubit/todo_list/todo_list_cubit.dart';
import 'package:ampcome_practical_app/counter/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final TextEditingController newTodoController = TextEditingController();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(labelText: 'Add to do here...',
        fillColor: Colors.white,
        border: InputBorder.none,
        filled: true,),
      onSubmitted: (String? todoDesc) {
        if (todoDesc != null && todoDesc.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodo(todoDesc);
          context.read<TodoFilterCubit>().changeFilter(Filter.all);
          newTodoController.clear();
        }
      },
    );
  }
}
