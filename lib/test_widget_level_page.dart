import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'event/my_event.dart';

class TestWidgetLevelPage extends StatefulWidget {
  @override
  _TestWidgetLevelPageState createState() => _TestWidgetLevelPageState();
}

class _TestWidgetLevelPageState extends State<TestWidgetLevelPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TestWidgetLevelPage"),
        ),
        body: Column(
          children: [
            _buildContainer(),
            TestLevelWidget(),
            functionWidget(
                child:functionWidget()
            ),
            ClassWidget(
              child : ClassWidget(),
            )
          ],
        )
    );
  }

  _buildContainer() {
    return Container(
      child: Text("Test"),
    );
  }

  Widget functionWidget({Widget? child}) {
    return Container(child: child);
  }
}

class ClassWidget extends StatelessWidget {
  final Widget? child;
  const ClassWidget({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class TestLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("TestLevelWidget"),
    );
  }
}