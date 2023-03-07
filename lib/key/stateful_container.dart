import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class StatefulContainer extends StatefulWidget {

  StatefulContainer({Key? key}) : super(key: key);

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {

  final Color color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  void initState() {
    log("$hashCode is build : ${context.hashCode}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}