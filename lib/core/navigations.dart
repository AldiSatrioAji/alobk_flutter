import 'package:alobk_app/core/routes.dart';
import 'package:flutter/cupertino.dart';

// void navigateWithoutHistory(BuildContext context) {
//   Navigator.of(context).pushReplacement("Routes.profile_student")
// }

void navigateTo(BuildContext buildContext, String routes) {
  Navigator.of(buildContext).pushNamed(routes);
}