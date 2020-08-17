import 'package:flutter/material.dart';
import 'package:mykeelive/utilAndDataTypes/configuration.dart';
import 'package:mykeelive/utilAndDataTypes/hexColor.dart';
import 'dart:math' as math;

abstract class BasePage extends StatefulWidget {
  final String name;
  final String path;

  _BasePage(); // Intentionally private empty constructor. Must pass params.

  Widget getNavDrawer(
      BuildContext context, Configuration config, bool isDarkMode) {
    if (name == "map") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: config.marginTop20,
              child: Row(
                children: [
                  CustomPaint(
                    painter: MyTickPainter(),
                    size: Size(18, 18),
                  ),
                  Text("Device Map",
                      style: Theme.of(context).textTheme.subtitle1.merge(
                          TextStyle(
                              color: isDarkMode ? Colors.black : Colors.white)))
                ],
              )),
          Padding(
              padding: config.marginLeft20Right20Top10,
              child: Text('Add a new MyKeeᵀᴹ',
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                      color: isDarkMode ? Colors.black : Colors.white)))),
          Padding(
              padding: config.marginLeft20Right20Top10,
              child: Text("Shop MyKeeᵀᴹ",
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                      color: isDarkMode ? Colors.black : Colors.white))))
        ],
      );
    }
    return Container();
  }

  BasePage({Key key, this.name, this.path}) : super(key: key);
}

// This is the Painter class
class MyTickPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(-size.width / 2, 0);
    final rect = Rect.fromCenter(
      center: Offset(size.height / 2, size.width / 2),
      height: size.height,
      width: size.width,
    );
    final startAngle = -math.pi / 2;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint = Paint()..color = HexColor.fromHex('#e48322');
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
