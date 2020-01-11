import 'package:alobk_app/bloc/authentication_bloc.dart';
import 'package:alobk_app/bloc/logout_bloc.dart';
import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/hero_tag.dart';
import 'package:alobk_app/core/margin.dart';
import 'package:alobk_app/core/strings.dart';
import 'package:alobk_app/core/widget.dart';
import 'package:alobk_app/data/repository/login_repository.dart';
import 'package:alobk_app/injection.dart';
import 'package:alobk_app/network/api_provider.dart';
import 'package:alobk_app/student/src/presentation/profile_screen/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogoutBloc>(
      create: (context) => sl<LogoutBloc>(),
      child: ProfileBody(),
    );
  }
}
