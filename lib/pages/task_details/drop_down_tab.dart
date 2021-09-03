import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownTab extends StatefulWidget {
  DropDownTab(
      {Key key,
      @required this.bottom,
      @required this.top,
      @required this.handler,
      @required this.tween})
      : super(key: key);
  final Widget bottom;
  final Widget top;
  final Widget handler;
  final Tween<double> tween;

  @override
  _DropDownTabState createState() => _DropDownTabState();
}

class _DropDownTabState extends State<DropDownTab>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    final Animation<double> curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _animation = widget.tween.animate(curve);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          widget.bottom,
          Positioned(
              top: _animation.value,
              child: Column(
                children: [
                  widget.top,
                  GestureDetector(
                      onTap: () {
                        this.setState(() {
                          if (_controller.status == AnimationStatus.completed) {
                            _controller.reverse();
                          } else if (_controller.status ==
                              AnimationStatus.dismissed) {
                            _controller.forward();
                          }
                        });
                      },
                      child: widget.handler),
                ],
              ))
        ],
      ),
    );
  }
}
