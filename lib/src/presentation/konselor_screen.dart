import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/navigations.dart';
import 'package:alobk_app/core/routes.dart';
import 'package:alobk_app/core/strings.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';

class KonselorScreen extends StatefulWidget {
  @override
  _KonselorScreenState createState() => _KonselorScreenState();
}

class _KonselorScreenState extends State<KonselorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profil Konselor",
            style: appBarTitleTheme,
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: 7,
          itemBuilder: (context, position) => _buildProfile(context, position),
        ));
  }

  Widget _buildProfile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => navigateTo(context, Routes.detailKonselor),
      child: ListTile(
        leading: Hero(tag: "HeroTag.profileStudentTag$index", child: CircleAvatar(backgroundImage: NetworkImage(dummyImageUrl))),
        title: Text("Dr. Ati Supriati"),
        subtitle: Text("Online"),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
