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
    log("StatefulContainer $hashCode initState: ${widget.key}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("StatefulContainer $hashCode is build : ${widget.key}");
    log("StatefulContainer $hashCode is build runtimeType: ${context.runtimeType}");
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }




}