import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DiarikuScreen extends StatefulWidget {
  @override
  _DiarikuScreenState createState() => _DiarikuScreenState();
}

const List<StaggeredTile> _tiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
  const StaggeredTile.count(4, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 4),
  const StaggeredTile.count(1, 3),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
];

class _DiarikuScreenState extends State<DiarikuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Diariku",
          style: appBarTitleTheme,
        ),
      ),
      body: Container(child: Text("Test123")),
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.homePaddingHorizontal,
                vertical: Dimens.homePaddingVertical),
            constraints:
                BoxConstraints.expand(height: Dimens.circularAppBarHeight),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.marginLarge, horizontal: Dimens.marginNormal),
            child: Text(
              "Diariku",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStaggeredGrid() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            Text("Some text"),
          ],
        ),
      ),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
