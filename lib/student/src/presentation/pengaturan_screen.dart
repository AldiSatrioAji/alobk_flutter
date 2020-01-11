import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';

class PengaturanScreen extends StatefulWidget {
  @override
  _PengaturanScreenState createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pengaturan",
            style: appBarTitleTheme,
          ),
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
