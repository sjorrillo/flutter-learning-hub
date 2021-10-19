import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_learning_hub/features/todo-list/models/todo-item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';
part 'todo_list_bloc.freezed.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(_Initial());

  @override
  Stream<TodoListState> mapEventToState(
    TodoListEvent event,
  ) async* {
    event.when(
      started: () {
        print("started");
      },
      itemAdded: (todo) {
        print("item added");
        print(todo);
      },
    );
  }
}
