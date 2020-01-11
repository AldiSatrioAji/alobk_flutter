import 'package:alobk_app/bloc/authentication_bloc.dart';
import 'package:alobk_app/bloc/authentication_event.dart';
import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/margin.dart';
import 'package:alobk_app/core/navigations.dart';
import 'package:alobk_app/core/routes.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:alobk_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleFeature {
  String title;
  IconData fontAwesomeIcons;
  String rute;

  CircleFeature({this.title, this.fontAwesomeIcons, this.rute});
}

class HomeScreen extends StatelessWidget {
  final isEmpty = true;

  List<CircleFeature> listFeature = [
    CircleFeature(
        title: "Konselor",
        fontAwesomeIcons: FontAwesomeIcons.personBooth,
        rute: Routes.konselor),
    CircleFeature(
        title: "Tatap Muka",
        fontAwesomeIcons: FontAwesomeIcons.database,
        rute: Routes.tatapMuka),
    CircleFeature(
        title: "Daring",
        fontAwesomeIcons: FontAwesomeIcons.personBooth,
        rute: Routes.daring),
    CircleFeature(
        title: "Tulis Diari",
        fontAwesomeIcons: FontAwesomeIcons.personBooth,
        rute: Routes.tulisDiari),
    CircleFeature(
        title: "Bacaan",
        fontAwesomeIcons: FontAwesomeIcons.personBooth,
        rute: Routes.bacaan),
    CircleFeature(
        title: "Pengaturan",
        fontAwesomeIcons: FontAwesomeIcons.personBooth,
        rute: Routes.pengaturan),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        create: (context) => sl<AuthenticationBloc>(),
        child: _buildBody(context));
  }

  Widget featureColumn(
      String title, String routes, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () => navigateTo(context, routes),
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // CircleAvatar(
          //   backgroundImage:
          //       NetworkImage("https://www.w3schools.com/w3images/team2.jpg"),
          // ),
          _buildIcon(icon),
          MarginVertical(margin: Dimens.marginSmall),
          Text(title)
        ],
      )),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(30.0)),
      child: Icon(icon, size: 25.0, color: Colors.white),
    );
  }

  Widget _buildBody(BuildContext context) {
    void doLogout() {
      BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildGreetingBlock(context),
          _buildFeatureList(context),
          _buildImproveSecurity()
        ],
      ),
    );
  }

  Widget _buildGreetingBlock(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.homePaddingHorizontal,
              vertical: Dimens.homePaddingVertical),
          constraints: BoxConstraints.expand(height: 150),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: Dimens.marginLarge, horizontal: Dimens.marginNormal),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Selamat Datang!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0)),
                  Text("Aldi Satrio Aji",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              MarginVertical(
                margin: Dimens.marginSmall,
              ),
              GestureDetector(
                onTap: () => {navigateTo(context, Routes.profileStudent)},
                child: Hero(
                  tag: HeroTag.profileStudentTag,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png"),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 100, left: Dimens.marginNormal, right: Dimens.marginNormal),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.marginNormal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Konseling Aktif",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text("Lihat semua",
                          style: TextStyle(color: Colors.blue, fontSize: 12.0))
                    ],
                  ),
                  Divider(),
                  MarginVertical(
                    margin: Dimens.marginNormal,
                  ),
                  isEmpty ? noAnnouncement() : showAnnouncement()
                ],
              ),
            ),
            elevation: 6.0,
          ),
        )
      ],
    );
  }

  Widget _buildFeatureList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimens.homePaddingHorizontal,
          right: Dimens.homePaddingHorizontal,
          top: Dimens.homePaddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Fitur tersedia", style: subtitle),
          MarginVertical(margin: Dimens.marginSmall),
          GridView.count(
            padding: EdgeInsets.all(0.0),
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            // children: listFeature.asMap().entries.map(())
            children: <Widget>[
              featureColumn("Konselor", Routes.konselor,
                  FontAwesomeIcons.chalkboardTeacher, context),
              featureColumn("Tatap Muka", Routes.tatapMuka,
                  FontAwesomeIcons.calendar, context),
              featureColumn("Daring", Routes.daring,
                  FontAwesomeIcons.rocketchat, context),
              featureColumn("Tulis Diari", Routes.tulisDiari,
                  FontAwesomeIcons.pencilAlt, context),
              featureColumn("Bacaan", Routes.bacaan,
                  FontAwesomeIcons.bookReader, context),
              featureColumn("Pengaturan", Routes.pengaturan,
                  FontAwesomeIcons.cog, context),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildImproveSecurity() {
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
                leading: Icon(Icons.security),
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

  Widget noAnnouncement() {
    return Text("Tidak ada konseling yang sedang aktif..",
        style: TextStyle(color: Colors.grey));
  }

  Widget showAnnouncement() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "5 Konseling sedang ", style: TextStyle(color: Colors.black)),
        TextSpan(text: "aktif ", style: TextStyle(color: Colors.green)),
        TextSpan(text: "sekarang! ", style: TextStyle(color: Colors.black)),
      ]),
    );
  }
}
