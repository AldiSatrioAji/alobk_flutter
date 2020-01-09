import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/margin.dart';
import 'package:alobk_app/core/strings.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:alobk_app/injection.dart';
import 'package:alobk_app/src/bloc/bloc.dart';
import 'package:alobk_app/src/presentation/profile_screen/alamat_screen.dart';
import 'package:alobk_app/src/presentation/profile_screen/pribadi_screen.dart';
import 'package:alobk_app/src/presentation/profile_screen/sekolah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  final int totalTab = 3;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: totalTab,
      vsync: this,
    );
  }

  static const double expandedLimit = 80.0;
  double top = 0.0;

  bool isExpanded() => top == expandedLimit;

  Widget _createProfile(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: <Widget>[_buildHeader(context), _buildPribadi(context)],
      ),
    );
  }

  Widget _buildIcons() {
    return Row(
      children: <Widget>[
        _buildIcon(),
        _buildIcon(),
        _buildIcon(),
      ],
    );
  }

  Widget _buildIcon() {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30.0)),
      child: Icon(
        Icons.ac_unit,
        size: 25.0,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.marginLarge),
      child: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: HeroTag.profileStudentTag,
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(
                    "https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png"),
              ),
            ),
            MarginVertical(
              margin: Dimens.marginSmall,
            ),
            Text("William Stone",
                style: TextStyle(color: Colors.white, fontSize: 18.0))
          ],
        ),
      ),
    );
  }

  Widget _buildPribadi(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.marginNormal, horizontal: Dimens.marginSmall),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // _buildIcon(),
          Text(
            "Data Pribadi",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          MarginVertical(
            margin: Dimens.marginSmall,
          ),
          _buildCard("NIS/Username", "1617116701"),
          _buildCard("Nomor Ponsel", "0878-3752-1294", copyAble: true),
          _buildCard("Nama Lengkap", "Aldi Satrio Aji"),
          _buildCard("Jenis Kelamin", "Laki-Laki"),
          _buildCard("Tempat, Tanggal Lahir", "Bandung, 27 September 2000"),
          _buildCard("Alamat", "Jl. Kota Madya, Bandung"),

          MarginVertical(
            margin: Dimens.marginNormal,
          ),
          Text(
            "Data Sekolah",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          MarginVertical(
            margin: Dimens.marginSmall,
          ),
          _buildCard("Sekolah", "SMKN 4 Bandung"),
          _buildCard("Kelas", "Kelas 10"),
          FlatButton.icon(
              onPressed: () => { BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()) },
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              label: Text(
                "Keluar Akun",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subTitle, {bool copyAble = false}) {
    return Card(
      elevation: 2.0,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: copyAble ? Icon(Icons.content_copy) : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: appBarTitleTheme,
        ),
      ),
      body: BlocProvider<AuthenticationBloc>(
        create: (context) => sl<AuthenticationBloc>(),
        child: _createProfile(context),
      ) 
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
