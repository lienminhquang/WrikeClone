import 'package:flutter/material.dart';
import 'package:wrike_clone/pages/task_details/task_details.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My to-do",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.blue,
                      size: 17,
                    ),
                    Text(
                      "All actives tasks",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  TaskItem(
                    index: 0,
                  ),
                  TaskItem(),
                  TaskItem(),
                  TaskItem(),
                  TaskItem(),
                  TaskItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({Key key, this.index = 1}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return TaskDetails();
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey[300], width: 0.5),
                top: index == 0
                    ? BorderSide(color: Colors.grey[300], width: 0.5)
                    : BorderSide.none)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Stack(children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.pink),
                child: Center(
                    child: Text(
                  "QL",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    child: Icon(
                      Icons.star_rounded,
                      color: Colors.white,
                      size: 13,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Colors.white)),
                  ))
            ]),
            Container(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "open editor",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("In Progress",
                        style:
                            TextStyle(fontSize: 13, color: Colors.purple[200])),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border:
                              Border.all(color: Colors.grey[300], width: 0.5)),
                      child: Text(
                        "Test",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text("23 Sep", style: TextStyle(color: Colors.grey[400])),
                Text("")
              ],
            )
          ],
        ),
      ),
    );
  }
}
