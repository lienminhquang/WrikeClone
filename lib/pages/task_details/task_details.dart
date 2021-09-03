import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wrike_clone/pages/task_details/attachments_tabview.dart';
import 'package:wrike_clone/pages/task_details/subtask_tabview.dart';
import 'package:wrike_clone/pages/task_details/task_tabview.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key key}) : super(key: key);

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  Widget _defaultAppBar;
  Widget _attachmentsSelectedAppBar;
  bool _useDefaulAppBar = true;

  @override
  void initState() {
    super.initState();
    _defaultAppBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      actions: [
        IconButton(
            icon: Icon(
              Icons.star_rounded,
              color: Colors.white,
            ),
            onPressed: () {}),
        IconButton(icon: Icon(Icons.push_pin_rounded), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
      ],
      bottom: TabBar(isScrollable: true, tabs: [
        Tab(
          child: Text("Task"),
        ),
        Tab(
          child: Text("Subtasks"),
        ),
        Tab(
          child: Text("Attachments"),
        ),
        Tab(
          child: Text("Time tracker"),
        ),
      ]),
    );

    _attachmentsSelectedAppBar = AppBar(
      leading: IconButton(
          icon: Icon(Icons.close_rounded),
          onPressed: () {
            this.setState(() {
              _useDefaulAppBar = true;
            });
          }),
      actions: [
        IconButton(
            icon: Icon(
              Icons.delete_rounded,
              color: Colors.white,
            ),
            onPressed: () {}),
      ],
      bottom: TabBar(isScrollable: true, tabs: [
        Tab(
          child: Text("Task"),
        ),
        Tab(
          child: Text("Subtasks"),
        ),
        Tab(
          child: Text("Attachments"),
        ),
        Tab(
          child: Text("Time tracker"),
        ),
      ]),
    );
  }

  List<int> selectedAttachments = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _useDefaulAppBar ? _defaultAppBar : _attachmentsSelectedAppBar,
        body: TabBarView(
          children: [
            TaskTabView(),
            SubtaskTaskView(),
            AttachmentsTabview(attachmentsSelected: (id, fliped) {
              this.setState(() {
                //log("message");
                if (fliped) {
                  selectedAttachments.add(id);
                } else {
                  selectedAttachments.remove(id);
                }
                _useDefaulAppBar = selectedAttachments.isEmpty;
              });
            }),
            Icon(Icons.directions_car),
          ],
        ),
      ),
    );
  }
}
