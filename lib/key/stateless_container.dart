import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class StatelessContainer extends StatelessWidget {

  final Color color;
  //
  // final Color color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
  //     .withOpacity(1.0);


  @override
  Widget build(BuildContext context) {
    log("StatelessContainer $hashCode is build : ${context.runtimeType}");
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }

  @override
  StatelessElement createElement() {
    log("StatelessContainer $hashCode createElement runtimeType:${this.runtimeType}");
    log("StatelessContainer $hashCode createElement key:${this.key}");
    return super.createElement();
  }

  const StatelessContainer({
    Key? key,
    this.color: const Color(0xFF2DBD3A),
  }) : super(key: key);
}
