import 'dart:developer';
import 'dart:typed_data';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/texture/lj_widget.dart';

import 'event/my_event.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class TexturePage extends StatefulWidget {
  @override
  _TexturePageState createState() => _TexturePageState();
}

class _TexturePageState extends State<TexturePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TexturePage"),
        ),
        body: Container(
          child: Column(
            children: [
              // OpenGLWidget(width: 500, height: 500),
              // OpenGLWidget(width: 500, height: 500),
              Image.asset("assets/images/image.webp"),
              // Image.asset("assets/images/gift1.png"),
              Image.asset("assets/images/2.0x/gift.png"),
              Image.asset("assets/images/gift.png"),
            ],
          ),
        ));
  }

  loadAsset() async {
    ByteData byteData = await rootBundle.load('assets/images/image.webp');
    log("byteData:$byteData");
  }

  @override
  void initState() {
    super.initState();
    loadAsset();
  }
}
