import 'package:flutter/material.dart';

class BacaanScreen extends StatefulWidget {
  @override
  _BacaanScreenState createState() => _BacaanScreenState();
}

class _BacaanScreenState extends State<BacaanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil Bacaan"),
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
