import 'package:alobk_app/teacher/src/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class TeacherScreen extends StatefulWidget {
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  int _bodyIndex = 0;

  List<Widget> listScreen = [
    HomeScreen(),
  ];

  void _changeBody(int index) {
    setState(
      () {
        _bodyIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listScreen[_bodyIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _bodyIndex,
      //   onTap: _changeBody,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //       ),
      //       title: new Text('Beranda'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.note,
      //       ),
      //       title: new Text('Diariku'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.favorite,
      //       ),
      //       title: new Text('Favorit'),
      //     ),
      //   ],
      // ),
    );
  }
}
