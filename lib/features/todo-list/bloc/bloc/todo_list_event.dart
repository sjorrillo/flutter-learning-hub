part of 'todo_list_bloc.dart';

@freezed
class TodoListEvent with _$TodoListEvent {
  const factory TodoListEvent.started() = _Started;
  const factory TodoListEvent.itemAdded(TodoItem todo) = _TodoAdded;
}