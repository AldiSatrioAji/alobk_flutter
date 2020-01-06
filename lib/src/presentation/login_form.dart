import 'package:alobk_app/core/dimens.dart';
import 'package:alobk_app/core/margin.dart';
import 'package:alobk_app/src/bloc/login_bloc.dart';
import 'package:alobk_app/src/bloc/login_event.dart';
import 'package:alobk_app/src/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passwordVisibility = false;

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return _buildBody(state);
      },
    );
  }

  Widget _buildBody(LoginState state) {
    final currentState = state;
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Center(
                child: Container(
                  child: Text(
                    "Hylos!",
                    style: TextStyle(color: Colors.white, fontSize: 48.0),
                  ),
                ),
              ),
              flex: 1),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(Dimens.marginLarge),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Masuk",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  MarginVertical(
                    margin: Dimens.marginNormal,
                  ),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Masukkan username";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: usernameClear,
                      ),
                      hintText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  MarginVertical(
                    margin: Dimens.marginNormal,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: passwordVisibility,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: passwordToggle,
                        icon: Icon(passwordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: true,
                      ),
                      Text("Simpan username saya.")
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(Dimens.marginNormal),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginButtonPressed(
                              username: _usernameController.text,
                              password: _passwordController.text),
                        )
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(Dimens.marginSmall)),
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                  MarginVertical(
                    margin: Dimens.marginNormal,
                  ),
                  Visibility(
                    child: CircularProgressIndicator(),
                    visible: currentState is LoginLoadingState,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void passwordToggle() {
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }

  void usernameClear() {
    _usernameController.clear();
  }
}
