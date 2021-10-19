import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning_hub/features/todo-list/bloc/bloc/todo_list_bloc.dart';
import 'package:flutter_learning_hub/features/todo-list/models/todo-item.dart';

const tdPrimaryColor = Color(0xff654AB5);
const tdTextColor = Color(0xff404040);
const tdBackgroundColor = Color(0xffF8F8F8);

const double tdDefaultPadding = 20.0;
const double tdDefaultBorderRadius = 10.0;

class TodoForm extends StatefulWidget {
  TodoForm({Key? key}) : super(key: key);

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBackgroundColor,
        iconTheme: IconThemeData(color: tdTextColor),
        elevation: 0,
        title: Text(
          "To Form",
          style: TextStyle(color: tdTextColor),
        ),
      ),
      body: BlocProvider(
        create: (context) => TodoListBloc(),
        child: Container(
            padding: EdgeInsets.all(tdDefaultPadding),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Title",
                    hintText: "Place holder",
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Place holder",
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print("clicked");
                      BlocProvider.of<TodoListBloc>(context)
                          .add(TodoListEvent.itemAdded(TodoItem(
                        id: 1,
                        title: "this is a title",
                        description: "this is a description",
                      )));
                    },
                    child: Text("Add Task"))
              ],
            )),
      ),
    );
  }
}
