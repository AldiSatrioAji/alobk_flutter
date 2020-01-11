import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';

class TatapMukaScreen extends StatefulWidget {
  @override
  _TatapMukaScreenState createState() => _TatapMukaScreenState();
}

class _TatapMukaScreenState extends State<TatapMukaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tatap Muka",
            style: appBarTitleTheme,
          ),
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
