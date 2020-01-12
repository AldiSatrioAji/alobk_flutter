import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImproveSecurity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.homePaddingVertical,
          horizontal: Dimens.homePaddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Tingkatkan keamanan", style: subtitle),
            // MarginVertical(margin: Dimens.marginNormal),
            ListTile(
                leading: Icon(FontAwesomeIcons.key),
                title: Text("Ubah kata sandi sekarang"),
                isThreeLine: true,
                subtitle:
                    Text("Kata sandimu saat ini menggunakan sandi default"),
                trailing: Icon(Icons.arrow_right)),
          ],
        ),
      ),
    );
  }
}