import 'dart:async';
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/stream/my_stream.dart';
import 'package:my_flutter_demo/test_page.dart';


class MyStreamPage extends StatefulWidget {
  @override
  _MyStreamPageState createState() => _MyStreamPageState();
}

class _MyStreamPageState extends State<MyStreamPage> {

  MyStream _stream = MyStream();

  @override
  void initState() {
    super.initState();
    log("MyStreamPage initState");
    _stream.init();

  }

  @override
  void dispose() {
    super.dispose();
    log("MyStreamPage dispose");
    _stream.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Stream页面"),
        ),
        body: Column(
          children: [
            Text("123"),
            SizedBox(height: 20,),
            GestureDetector(
              child: Container(
                color: Colors.green,
                width: double.infinity,
                height: 44,
                alignment: Alignment.center,
                child: Text(
                  "开始",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              onTap: () {
                _stream.start();
              },
            ),
          ],
        ));
  }


}
