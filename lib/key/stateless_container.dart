import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class StatelessContainer extends StatelessWidget {

  final Color color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);


  @override
  Widget build(BuildContext context) {
    log("$hashCode is build : ${context.hashCode}");
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
