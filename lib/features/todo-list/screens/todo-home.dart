import 'package:flutter/material.dart';
import 'package:flutter_learning_hub/features/todo-list/screens/todo-form.dart';
import 'package:flutter_learning_hub/features/todo-list/screens/widgets/todo-actions.dart';
import 'package:flutter_learning_hub/features/todo-list/screens/widgets/todo-list.dart';
import 'package:flutter_learning_hub/features/todo-list/screens/widgets/todo-quick-filters.dart';

class TodoHome extends StatefulWidget {
  TodoHome({Key? key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

const tdPrimaryColor = Color(0xff654AB5);
const tdTextColor = Color(0xff404040);
const tdBackgroundColor = Color(0xffF8F8F8);

const double tdDefaultPadding = 20.0;
const double tdDefaultBorderRadius = 10.0;

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBackgroundColor,
      appBar: AppBar(
        backgroundColor: tdBackgroundColor,
        elevation: 0,
        title: Text(
          "To Do",
          style: TextStyle(color: tdTextColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(tdDefaultPadding),
        child: Column(
          children: [
            TodoActions(
              onAdd: handleAddTodo,
            ),
            TodoQuickFilters(),
            Expanded(
              child: TodoList(),
            ),
          ],
        ),
      ),
    );
  }

  void handleAddTodo() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => TodoForm()));
  }
}
