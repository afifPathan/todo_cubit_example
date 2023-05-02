import 'package:ampcome_practical_app/counter/cubit/active_todo_counts/active_todo_count_cubit.dart';
import 'package:ampcome_practical_app/counter/cubit/filtered_todos/filtered_todos_cubit.dart';
import 'package:ampcome_practical_app/counter/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:ampcome_practical_app/counter/cubit/todo_list/todo_list_cubit.dart';
import 'package:ampcome_practical_app/counter/view/pages/todos_page.dart';
import 'package:ampcome_practical_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TodoFilterCubit>(
            create: (context) => TodoFilterCubit(),
          ),
          BlocProvider<TodoListCubit>(
            create: (context) => TodoListCubit(),
          ),
          BlocProvider<ActiveTodoCountCubit>(
            create: (context) => ActiveTodoCountCubit(
              initialActiveTodoCount:
                  context.read<TodoListCubit>().state.todos.length,
              todoListCubit: BlocProvider.of<TodoListCubit>(context),
            ),
          ),
          BlocProvider<FilteredTodosCubit>(
            create: (context) => FilteredTodosCubit(
              initialTodoList: context.read<TodoListCubit>().state.todos,
              todoListCubit: context.read<TodoListCubit>(),
              todoFilterCubit: context.read<TodoFilterCubit>(),
            ),
          ),
        ],
        child: const TodosPage(),
      ),
    );
  }
}
