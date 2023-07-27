import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'event/my_event.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync:this,
      duration: Duration(seconds:2),
      reverseDuration: Duration(seconds:5),
      debugLabel: "animation",
      // upperBound: 0.20,
      // lowerBound: 0.0,
    );
    // _animation = Tween(begin: 0.0, end: -0.1).animate(_controller!);
    _animation = Tween(begin: 0.0, end: 0.1).animate(_controller!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Page"),
        ),
        body: Column(
          children: [
            GestureDetector(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: 44,
                alignment: Alignment.center,
                child: Text(
                  "Button正向",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              onTap: () {
                _animation = Tween(begin: 0.0, end: 0.1).animate(_controller!);
                log("click click");
                _controller?.reset();
                _controller?.repeat();
                // _controller?.reverse(from: 200);
              },
            ),
            GestureDetector(
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: 44,
                alignment: Alignment.center,
                child: Text(
                  "Button 反向",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              onTap: () {
                log("click click");
                _animation = Tween(begin: 0.0, end: -0.1).animate(_controller!);
                _controller?.reset();
                _controller?.repeat();
                // _controller?.reverse(from: 200);
              },
            ),

            SizedBox(height: 100,),
            RotationTransition(
              turns: _animation!,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            )
          ],
        ));
  }

}
