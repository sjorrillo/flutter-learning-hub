import 'package:flutter/material.dart';

class TodoActions extends StatelessWidget {

  final void Function() onAdd;

  const TodoActions({Key? key, required this.onAdd }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Welcome, Peter"),
          TextButton.icon(
            onPressed: onAdd,
            icon: Icon(Icons.add),
            label: Text("Add Task")
          )
        ],
      ),
    );
  }
}
