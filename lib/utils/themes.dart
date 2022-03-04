import 'package:flutter/material.dart';
import 'package:qr_scanner_app/utils/colors.dart';

class MyTheme {
  MyTheme._();

  static const IconThemeData _iconThemeData =
      IconThemeData(color: MyColor.black);

  static const TextTheme _textThemeData = TextTheme(
    bodyText1: TextStyle(
      color: MyColor.white,
    ),
    bodyText2: TextStyle(
      color: MyColor.white,
    ),
  );

  static const TextStyle textStyle = TextStyle(
    color: MyColor.black,
    fontSize: 15,
  );

  static final List<Map<String, ThemeData>> allThemes = [
    {"lightBlue": lightBlueTheme},
    {"darkBlue": darkBlueTheme},
    {"royalBlue": royalBlueTheme},
    {"lightPurple": lightPurpleTheme},
    {"darkPurple": darkPurpleTheme},
    {"orange": orangeTheme},
    {"green1": green1Theme},
    {"green2": green2Theme},
    {"green3": green3Theme},
    {"black": blackTheme},
  ];

  static final ThemeData lightBlueTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.lightBlue,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.lightBlue,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.lightBlue,
      secondary: MyColor.darkBlue,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData darkBlueTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.darkBlue,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.darkBlue,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.darkBlue,
      secondary: MyColor.lightBlue,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData royalBlueTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.royalBlue,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.royalBlue,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.royalBlue,
      secondary: MyColor.lightBlue,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData lightPurpleTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.lightPurple,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.lightPurple,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.lightPurple,
      secondary: MyColor.darkPurple,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData darkPurpleTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.darkPurple,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.darkPurple,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.darkPurple,
      secondary: MyColor.darkPurple,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData orangeTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.orange,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.orange,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.orange,
      secondary: MyColor.black,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData green3Theme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.green3,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.green3,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.green3,
      secondary: MyColor.green1,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData green2Theme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.green2,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.green2,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.green2,
      secondary: MyColor.green1,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData green1Theme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.green1,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.green1,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.green1,
      secondary: MyColor.green3,
    ),
    iconTheme: _iconThemeData,
  );

  static final ThemeData blackTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColor.black,
      iconTheme: IconThemeData(color: MyColor.white),
      elevation: 0,
    ),
    scaffoldBackgroundColor: MyColor.black,
    textTheme: _textThemeData,
    colorScheme: const ColorScheme.light(
      primary: MyColor.black,
      secondary: MyColor.lightPurple,
    ),
    iconTheme: _iconThemeData,
  );
}
