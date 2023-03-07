import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'event/my_event.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Page"),
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 44,
                    alignment: Alignment.center,
                    child: Text(
                      "确认",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {
                    MyEventBus.getInstance().fire(EventErrorPageClose());
                  },
                ))
          ],
        ));
  }
}
