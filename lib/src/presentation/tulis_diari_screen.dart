import 'package:alobk_app/core/dimens.dart';
import 'package:flutter/material.dart';

class TulisDiariScreen extends StatefulWidget {
  @override
  _TulisDiariScreenState createState() => _TulisDiariScreenState();
}

class _TulisDiariScreenState extends State<TulisDiariScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil TulisDiari"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(Dimens.marginNormal),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("8 Januari 21:45", style: TextStyle(color: Colors.grey)),
                  VerticalDivider(),
                  Text("20 Character", style: TextStyle(color: Colors.grey))
                ],
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              )
            ],
          ),
        ));
  }
}
