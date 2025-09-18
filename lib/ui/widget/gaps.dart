import 'package:flutter/material.dart';

class GapVertical extends StatelessWidget {
  final double height;

  const GapVertical(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class GapHorizontal extends StatelessWidget {
  final double width;

  const GapHorizontal(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: width);
  }
}
