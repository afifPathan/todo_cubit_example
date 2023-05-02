import 'package:ampcome_practical_app/counter/cubit/active_todo_counts/active_todo_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 50, color: Colors.grey),
        ),
        Text(
          '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items',
          style: const TextStyle(fontSize: 30, color: Colors.grey),
        ),
      ],
    );
  }
}
