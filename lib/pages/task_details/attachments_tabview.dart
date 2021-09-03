import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef AttachmentItemSelectedCallback = void Function(int, bool);

class AttachmentsTabview extends StatelessWidget {
  const AttachmentsTabview({Key key, @required this.attachmentsSelected})
      : super(key: key);
  final AttachmentItemSelectedCallback attachmentsSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return AttachmentItem(
                attachmentItemFliped: (id, flipped) {
                  attachmentsSelected(id, flipped);
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: Center(
          child: Icon(
            Icons.attach_file_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

typedef AttachmentItemFliped = void Function(int, bool);

class AttachmentItem extends StatefulWidget {
  const AttachmentItem({Key key, @required this.attachmentItemFliped})
      : super(key: key);
  final AttachmentItemFliped attachmentItemFliped;
  @override
  _AttachmentItemState createState() => _AttachmentItemState();
}

class _AttachmentItemState extends State<AttachmentItem>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _imageFliped = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0, end: pi).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.addListener(() {
      this.setState(() {
        _imageFliped = _animation.value >= pi / 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
      padding: EdgeInsets.all(13),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (_animationController.status == AnimationStatus.completed) {
                _animationController.reverse();
                widget.attachmentItemFliped(0, !_imageFliped);
              } else if (_animationController.status ==
                  AnimationStatus.dismissed) {
                _animationController.forward();
                widget.attachmentItemFliped(0, !_imageFliped);
              }
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.006)
                ..rotateY(_animation.value),
              child: Container(
                  width: 40,
                  height: 40,
                  child: _imageFliped
                      ? Transform(
                          transform: Matrix4.identity()..rotateY(pi),
                          alignment: Alignment.center,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color: Colors.blue),
                              child: Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                              )),
                        )
                      : Image.asset(
                          "images/test.jpg",
                          fit: BoxFit.cover,
                        )),
            ),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("test.jpg"),
                Container(
                  height: 5,
                ),
                Text(
                  "ver. 1 . 23 Aug by Quang Lien",
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          PopupMenuButton(
              child: Icon(
                Icons.more_vert_rounded,
                color: Colors.grey[600],
              ),
              onSelected: (value) {},
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Save Attachment"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Delete"),
                      value: 2,
                    )
                  ]),
        ],
      ),
    );
  }
}
