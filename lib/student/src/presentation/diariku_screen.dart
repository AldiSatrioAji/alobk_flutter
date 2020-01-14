import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/margin.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:alobk_app/data/terms.dart';

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

const List<String> title = [
  "Gotong Royong",
  "Hari Terbaik",
  "Membantu Teman",
  "Toleransi yang nyata",
  "Kerja bakti",
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildAboutDialog(context),
              );
            },
            icon: Icon(
              Icons.help,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildAboutDialog(context),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[_buildFilterAndSearch()],
        ),
      ),
    );
  }

  Widget _buildFilterAndSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Filter", style: TextStyle(color: Colors.grey)),
        DropdownButton<String>(
          value: "Semua",
          icon: Icon(Icons.filter_list),
          items: <String>['Semua', 'Akademik', 'Pribadi', 'Sosial', 'Karir']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        _buildListCard("Gotong Royong"),
        _buildListCard("Hari Terbaik"),
        _buildListCard("Membantu Teman"),
        _buildListCard("Toleransi yang nyata"),
        _buildListCard("Kerja bakti"),
      ],
    );
  }

  Widget _buildListCard(String title) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Container(
          padding: const EdgeInsets.all(Dimens.marginNormal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("13/06/2019"),
              MarginVertical(margin: 3.0,),
              Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
          labelText: "Cari",
          hintText: "Cari",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)))),
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

  Widget _buildListDiaries() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Test'),
          );
        },
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Bantuan'),
      content: ListView(
        children: <Widget>[
          _buildAboutText(),
          _buildLogoAttribution(),
        ],
      ),
      // content: new Column(
      //   mainAxisSize: MainAxisSize.min,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     _buildAboutText(),
      //     _buildLogoAttribution(),
      //   ],
      // ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay, got it!'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return new RichText(
      text: new TextSpan(
        text: TermsAndCondition.data,
        style: const TextStyle(color: Colors.black87),
        children: <TextSpan>[
          const TextSpan(text: 'The app was developed with '),
          new TextSpan(
            text: 'Flutter',
          ),
          const TextSpan(
            text: ' and it\'s open source; check out the source '
                'code yourself from ',
          ),
          new TextSpan(
            text: 'www.codesnippettalk.com',
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _buildLogoAttribution() {
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: new Image.asset(
              "assets/flutter.png",
              width: 32.0,
            ),
          ),
          const Expanded(
            child: const Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: const Text(
                'Popup window is like a dialog box that gains complete focus when it appears on screen.',
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
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
