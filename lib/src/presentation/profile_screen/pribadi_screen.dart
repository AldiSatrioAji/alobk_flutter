import 'package:flutter/material.dart';

class PribadiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // _buildInfo(),
        // _buildInfo(),
        // _buildInfo(),
        // _buildInfo(),
        // _buildInfo(),
        // _buildInfo(),
        // _buildInfo(),
      ],
    );
  }

  Widget _buildInfo(String title, String subtitle) {
    return Card(
      elevation: 4.0,
      child: ListTile(title: Text("$title"), subtitle: Text("$subtitle")),
    );
  }
}
