import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:alobk_app/src/presentation/profile_screen/alamat_screen.dart';
import 'package:alobk_app/src/presentation/profile_screen/pribadi_screen.dart';
import 'package:alobk_app/src/presentation/profile_screen/sekolah_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: totalTab,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      title: isExpanded() ? Text("Collapsing Toolbar", style: appBarTitleTheme) : null,
                      background: Hero(
                        tag: HeroTag.profileStudentTag,
                        child: Image.network(
                          "https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: controller,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.person), text: "Pribadi"),
                      Tab(icon: Icon(Icons.school), text: "Sekolah"),
                      Tab(icon: Icon(Icons.location_on), text: "Alamat"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              PribadiScreen(),
              SekolahScreen(),
              AlamatScreen()
            ],
          )
        ),
      ),
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
