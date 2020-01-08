import 'package:alobk_app/src/presentation/diariku_screen.dart';
import 'package:alobk_app/src/presentation/favoritku_screen.dart';
import 'package:alobk_app/src/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  int _bodyIndex = 0;

  List<Widget> listScreen = [
    HomeScreen(),
    DiarikuScreen(),
    FavoritkuScreen(),
  ];

  void _changeBody(int index) {
    setState(() {
      _bodyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: listScreen[_bodyIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bodyIndex,
          onTap: _changeBody,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: new Text('Beranda'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.note,
              ),
              title: new Text('Diariku'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: new Text('Favorit'),
            ),
          ],
        ));
  }
}