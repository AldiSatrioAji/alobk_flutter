
import 'package:flutter/material.dart';

class MarginVertical extends StatelessWidget {

  final double margin;

  const MarginVertical({Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: margin,
    );
  }
}

class MarginHorizontal extends StatelessWidget {

  final double margin;

  const MarginHorizontal({Key key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: margin,
    );
  }
}