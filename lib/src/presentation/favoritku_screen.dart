import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';

class FavoritkuScreen extends StatefulWidget {
  @override
  _FavoritkuScreenState createState() => _FavoritkuScreenState();
}

class _FavoritkuScreenState extends State<FavoritkuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorit",
          style: appBarTitleTheme,
        ),
      ),
      body: Container(child: Text("Test123")),
    );
  }
}