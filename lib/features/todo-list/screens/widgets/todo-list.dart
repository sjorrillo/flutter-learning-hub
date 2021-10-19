import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = ["blue", "black", "red"];
    return ListView.builder(
      itemBuilder: renderItem,
      itemCount: items.length,
    );
  }

  Widget renderItem(BuildContext context, int index) {
    return Container(
      child: Text("Item $index"),
    );
  }
}
