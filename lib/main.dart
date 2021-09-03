import 'package:flutter/material.dart';
import 'package:wrike_clone/pages/inbox/inbox.dart';
import 'package:wrike_clone/pages/todos/todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _child = [
    Inbox(),
    TodosPage(),
    Container(),
  ];

  void onTab(int index) {
    if (index == 3) {
      showMoreChoices(context);
      return;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _child[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF04454D),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "My to-dos"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Spaces"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
        onTap: onTab,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void showMoreChoices(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Color(0xFF04454D)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMoreChoiceItem(context, Icons.dashboard_outlined,
                    "Dashboards", (context) {}),
                _buildMoreChoiceItem(context, Icons.notifications_outlined,
                    "Activity", (context) {}),
                _buildMoreChoiceItem(context, Icons.star_border_rounded,
                    "Starred", (context) {}),
                _buildMoreChoiceItem(context, Icons.pending_actions_outlined,
                    "Timesheets", (context) {}),
                _buildMoreChoiceItem(context, Icons.date_range_outlined,
                    "Celendars", (context) {}),
                _buildMoreChoiceItem(
                    context, Icons.poll_outlined, "Reports", (context) {}),
                _buildMoreChoiceItem(context, Icons.feedback_outlined,
                    "Feedbacks", (context) {}),
              ],
            ),
          );
        });
  }

  Widget _buildMoreChoiceItem(BuildContext context, IconData icon, String title,
      void Function(BuildContext) callback) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          Container(
            width: 13,
          ),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }
}
