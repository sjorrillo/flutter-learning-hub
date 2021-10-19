import 'package:flutter_learning_hub/features/todo-list/models/todo-item.dart';

abstract class ITodoListRepo {
  void saveItem(TodoItem item);
}