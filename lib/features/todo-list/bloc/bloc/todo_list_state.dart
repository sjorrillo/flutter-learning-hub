part of 'todo_list_bloc.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState.initial() = _Initial;
  const factory TodoListState.addTodo() = _AddTodo;
}
