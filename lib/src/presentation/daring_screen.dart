import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';

class DaringScreen extends StatefulWidget {
  @override
  _DaringScreenState createState() => _DaringScreenState();
}

class _DaringScreenState extends State<DaringScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Daring",
            style: appBarTitleTheme,
          ),
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
