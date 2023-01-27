import 'package:flutter/material.dart';
import 'package:simple_helpers/theme/app_colors.dart';

ThemeData? theme;
ThemeData? lightTheme;
ThemeData? darkTheme;

TextTheme textTh(BuildContext context) {
  return th(context).textTheme;
}

ThemeData th(BuildContext context) {
  return Theme.of(context);
}

AppColors defaultAppColors({bool isDark = true}) {
  final theme = isDark ? ThemeData.dark() : ThemeData.fallback();
  return AppColors(
    cardColor: theme.cardColor,
    disabledColor: theme.disabledColor,
    errorColor: theme.errorColor,
    dividerColor: theme.dividerColor,
    highlightColor: theme.highlightColor,
    hintColor: theme.hintColor,
    hoverColor: theme.hoverColor,
    primaryColor: theme.primaryColor,
    scaffoldColor: theme.scaffoldBackgroundColor,
    canvasColor: theme.canvasColor,
    dialogBackgroundColor: theme.dialogBackgroundColor,
    focusColor: theme.focusColor,
    primaryColorDark: theme.primaryColorDark,
    primaryColorLight: theme.primaryColorLight,
    shadowColor: theme.shadowColor,
    splashColor: theme.splashColor,
    toggleableActiveColor: theme.toggleableActiveColor,
    unselectedWidgetColor: theme.unselectedWidgetColor,
  );
}

TextTheme defaultTextTheme([TextStyle mainFont = const TextStyle()]) {
  return TextTheme(
    headline1: mainFont.copyWith(
      fontSize: 26,
    ),
    headline2: mainFont.copyWith(
      fontSize: 24,
    ),
    headline3: mainFont.copyWith(
      fontSize: 22,
    ),
    headline4: mainFont.copyWith(
      fontSize: 20,
    ),
    headline5: mainFont.copyWith(
      fontSize: 18,
    ),
    headline6: mainFont.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: mainFont.copyWith(
      fontSize: 14,
    ),
    subtitle2: mainFont.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: mainFont.copyWith(
      fontSize: 14,
    ),
    bodyText2: mainFont.copyWith(
      fontSize: 13,
    ),
    button: mainFont.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    caption: mainFont.copyWith(
      fontSize: 12,
    ),
  );
}

//Default
