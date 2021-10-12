import 'package:flutter/material.dart';
import 'package:projetoflutter/utils/constants.dart';

mixin TemaPadrao {
  static ThemeData get() => ThemeData(
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Constants.accent),
        textTheme: _defaultTextTheme(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Constants.primaria)
            .copyWith(secondary: Constants.accent),
      );
  static TextTheme _defaultTextTheme() => const TextTheme(
        headline3: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 45,
          color: Constants.accent,
        ),
        button: TextStyle(
          fontFamily: 'OpenSans',
        ),
        caption: TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Constants.primaria,
        ),
        headline1: TextStyle(fontFamily: 'Quicksand'),
        headline2: TextStyle(fontFamily: 'Quicksand'),
        headline4: TextStyle(fontFamily: 'Quicksand'),
        headline5: TextStyle(fontFamily: 'NotoSans'),
        headline6: TextStyle(fontFamily: 'NotoSans'),
        subtitle1: TextStyle(fontFamily: 'NotoSans'),
        bodyText1: TextStyle(fontFamily: 'NotoSans'),
        bodyText2: TextStyle(fontFamily: 'NotoSans'),
        subtitle2: TextStyle(fontFamily: 'NotoSans'),
        overline: TextStyle(fontFamily: 'NotoSans'),
      );
}
