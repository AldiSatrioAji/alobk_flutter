import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/strings.dart';
import 'package:flutter/material.dart';

class DetailKonselorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: HeroTag.profileStudentTag,
        child: Image.network(dummyImageUrl)
      ),
    );
  }
}