import 'package:alobk_app/bloc/authentication_bloc.dart';
import 'package:alobk_app/bloc/authentication_event.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PengaturanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pengaturan",
            style: appBarTitleTheme,
          ),
        ),
        body: Container(
          child: FlatButton(
            child: Text("Logout"),
            onPressed: () =>
                {BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut())},
          ),
        ));
  }
}
