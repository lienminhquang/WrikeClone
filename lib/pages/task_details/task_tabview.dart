import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'drop_down_tab.dart';

class TaskTabView extends StatefulWidget {
  const TaskTabView({Key key}) : super(key: key);

  @override
  _TaskTabViewState createState() => _TaskTabViewState();
}

class _TaskTabViewState extends State<TaskTabView> {
  String status = "New";
  Color statusColor = Colors.blue;
  IconData statusIcon = Icons.check_box_outline_blank_rounded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DropDownTab(
        tween: Tween<double>(begin: 0, end: -440),
        handler: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: Colors.grey[300], width: 0.5))),
            child: Center(
                child: const Text(
              "Show comments",
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.w500),
            ))),
        bottom: Container(
          color: Colors.white,
          child: _Comments(),
        ),
        top: Container(
          color: Colors.white,
          height: 445,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "open editor",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                            child: Text(
                              "Include iostream",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              var result = await showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 13),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Default Workflow",
                                              style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 13)),
                                          Text("Change status to",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)),
                                          _buildStatusItem(
                                              context,
                                              "New",
                                              Colors.blue,
                                              Icons
                                                  .check_box_outline_blank_rounded),
                                          _buildStatusItem(
                                              context,
                                              "Completed",
                                              Colors.blue,
                                              Icons.check_box_rounded),
                                          _buildStatusItem(
                                              context,
                                              "In Progress",
                                              Colors.pink,
                                              Icons
                                                  .check_box_outline_blank_rounded),
                                          _buildStatusItem(
                                              context,
                                              "On Hold",
                                              Colors.grey,
                                              Icons
                                                  .check_box_outline_blank_rounded),
                                          _buildStatusItem(
                                              context,
                                              "Cancelled",
                                              Colors.grey,
                                              Icons
                                                  .check_box_outline_blank_rounded),
                                        ],
                                      ),
                                    );
                                  });
                              if (result is List<dynamic>) {
                                this.setState(() {
                                  this.status = result[0];
                                  this.statusColor = result[1];
                                  this.statusIcon = result[2];
                                });
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Container(
                                color: Colors.blue[50],
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 7,
                                      height: 50,
                                      color: this.statusColor,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(
                                        this.statusIcon,
                                        color: this.statusColor,
                                      ),
                                    ),
                                    Text(this.status),
                                    Spacer(),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Icon(
                                        Icons.expand_more_rounded,
                                        color: Colors.blue,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45),
                                      color: Colors.pink),
                                  child: Center(
                                      child: Text(
                                    "QL",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ),
                                Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.grey,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45),
                                      color: Colors.pink),
                                  child: Center(
                                      child: Text(
                                    "QL",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.grey[600],
                                    size: 15,
                                  ),
                                ),
                                Text(
                                  "Set date",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.folder_outlined,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.grey, width: 1)),
                                  child: Text(
                                    "Test",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey[300], width: 0.5))),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Tab to add descriptions",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            child: TextField(
              maxLines: null,
              decoration: InputDecoration(
                  hintText: "Write a commment",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Spacer(),
                IconButton(
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.blue,
                    ),
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatusItem(
      BuildContext context, String name, Color color, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop([name, color, icon]);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(3)),
            ),
            Container(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: ListView(
        children: [
          Container(
            height: 50,
          ),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          _Comment(),
          Container(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class _Comment extends StatelessWidget {
  const _Comment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            //margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45), color: Colors.pink),
            child: Center(
                child: Text(
              "QL",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffF7F6F9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Quang Lien",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        "20:42",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "chao xin`",
                    maxLines: 100,
                  ),
                  Emojies()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Emojies extends StatefulWidget {
  const Emojies({Key key}) : super(key: key);

  @override
  _EmojiesState createState() => _EmojiesState();
}

class _EmojiesState extends State<Emojies> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              this.setState(() {
                isLiked = !isLiked;
              });
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey[300])),
              child: Container(
                width: 30,
                height: 20,
                child: Icon(
                  Icons.thumb_up_rounded,
                  color: isLiked ? Colors.yellow : Colors.grey,
                  size: 15,
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(color: Colors.grey[300])),
              child: Container(
                width: 20,
                height: 20,
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
