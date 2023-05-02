import 'dart:ui';

import 'package:equatable/equatable.dart';

enum Filter {
  all,
  active,
  completed;
}

class Todo extends Equatable {
  final String id;
  final String desc;
  final Color color;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    required this.color,
    this.completed = false,
  }) : id = id ?? 'a';

  @override
  List<Object> get props => [id, desc, color, completed];

  @override
  String toString() => 'Todo(id: $id, desc: $desc, color: $color, completed: $completed)';

  Todo copyWith({
    String? id,
    String? desc,
    Color? color,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      completed: completed ?? this.completed,
    );
  }
}
