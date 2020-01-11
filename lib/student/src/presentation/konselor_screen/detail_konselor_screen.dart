import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/strings.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';

class DetailKonselorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Konselor", style: appBarTitleTheme,),
      ),
    );
  }
}