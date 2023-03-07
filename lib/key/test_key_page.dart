import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/key/stateful_container.dart';
import 'package:my_flutter_demo/key/stateless_container.dart';

/// flutter key learn
/// 参考文章 https://juejin.cn/post/6844903811870359559
class TestKeyPage extends StatefulWidget {
  @override
  _TestKeyPageState createState() => _TestKeyPageState();
}

class _TestKeyPageState extends State<TestKeyPage> {

  List<Widget> widgets = [
    StatelessContainer(),
    StatelessContainer(),
  ];

  List<Widget> statefulWidgets = [
    StatefulContainer(key: UniqueKey(),),
    StatefulContainer(key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("stateless widget"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...widgets,
              ],
            ),
            Text("stateful widget"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...statefulWidgets
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget(){
    log("switchWidget");
    // widgets.insert(0, widgets.removeAt(1));
    statefulWidgets.insert(0, statefulWidgets.removeAt(1));
    setState(() {});
  }
}
