import 'package:flutter/material.dart';

ThemeData? theme;
ThemeData? darkTheme;

TextTheme? textTheme;

TextTheme textTh(BuildContext context) {
  return th(context).textTheme;
}

ThemeData th(BuildContext context) {
  return Theme.of(context);
}
