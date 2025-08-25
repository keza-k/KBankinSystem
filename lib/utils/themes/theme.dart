import 'package:flutter/material.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texttheme.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/appbar_theme.dart';

class KBankingTheme{
  KBankingTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: KAppBarTheme.lightAppBarTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: KTextTheme.darkTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: KAppBarTheme.darkAppBarTheme,

  );
}