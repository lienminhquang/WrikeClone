import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final List<String> filter = ["Incomming", "Sent", "Archive"];
  int currentFilter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert_rounded, color: Colors.grey),
              onPressed: () {})
        ],
        title: PopupMenuButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                  child: Text(
                    filter[currentFilter],
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    maxLines: 1,
                  ),
                ),
                Icon(
                  Icons.expand_more_outlined,
                  color: Colors.black,
                  size: 17,
                )
              ],
            ),
            onSelected: (value) {
              this.setState(() {
                currentFilter = value;
              });
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(
                      "Incomming",
                      style: TextStyle(color: Colors.black),
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text("Sent"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Archive"),
                    value: 2,
                  )
                ]),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
