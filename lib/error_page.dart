import 'dart:async';
import 'dart:developer';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/test_page.dart';

import 'event/my_event.dart';

class ErrorPage extends StatefulWidget {
  @override
  _MyErrorPageState createState() => _MyErrorPageState();
}

class _MyErrorPageState extends State<ErrorPage> {

  StreamSubscription? _closeSubscription;

  @override
  void initState() {
    super.initState();
    log("listen initState");
    _closeSubscription = MyEventBus.getInstance().on<EventErrorPageClose>().listen((event) {
      log("listen event:$event");
      Navigator.of(context).removeRoute(ModalRoute.of(context)!);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _closeSubscription?.cancel();
    log("listen dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试页面"),
        ),
        body: Stack(
          children: [
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: Container(
                    color: Colors.green,
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
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => TestPage()
                        )
                    );
                  },
                ))
          ],
        ));
  }


}
