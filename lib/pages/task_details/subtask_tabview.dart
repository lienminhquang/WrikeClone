import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wrike_clone/pages/todos/todos.dart';

class SubtaskTaskView extends StatefulWidget {
  const SubtaskTaskView({Key key}) : super(key: key);

  @override
  _SubtaskTaskViewState createState() => _SubtaskTaskViewState();
}

class _SubtaskTaskViewState extends State<SubtaskTaskView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return TaskItem();
          }),
    );
  }
}
