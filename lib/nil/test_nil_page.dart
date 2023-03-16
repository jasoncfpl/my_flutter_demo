import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/key/stateful_container.dart';
import 'package:my_flutter_demo/key/stateless_container.dart';
import 'package:nil/nil.dart';

/// flutter nil test
/// https://github.com/letsar/nil
class TestNilPage extends StatefulWidget {
  @override
  _TestNilPageState createState() => _TestNilPageState();
}

class _TestNilPageState extends State<TestNilPage> {

  List<Widget> widgets = [];


  @override
  void initState() {
    super.initState();
    for (int i = 0; i< 100000; i ++) {
      widgets.add(new Container());
      // widgets.add(new SizedBox());
      // widgets.add(nil);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("nil widget"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...widgets,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
