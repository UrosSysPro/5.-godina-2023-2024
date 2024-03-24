import 'package:flutter/material.dart';

class ReelsView extends StatelessWidget {
  ReelsView({super.key});
  var colors=[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.redAccent,
    Colors.cyanAccent
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) => Container(),
    );
  }
}
