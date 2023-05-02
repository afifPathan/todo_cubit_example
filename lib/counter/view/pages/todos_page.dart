import 'package:ampcome_practical_app/counter/view/pages/create_todo.dart';
import 'package:ampcome_practical_app/counter/view/pages/show_todos.dart';
import 'package:ampcome_practical_app/counter/view/pages/todos_header.dart';
import 'package:flutter/material.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: const [
                TodoHeader(),
                CreateTodo(),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                ShowTodos()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
