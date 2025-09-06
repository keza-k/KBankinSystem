import 'package:flutter/material.dart';
 class KColors{
   KColors._();

   static const Color primary= Color(0xFFFFFFFF);
   static const Color secondary = Color(0xFF000000);
   static const Color accent = Color(0xFF76B4E4);

   //Gradient colors
   static const Gradient linearGradient = LinearGradient(
     begin: Alignment(0.0, 0.0),
     end: Alignment(0.707, -0.707),
       colors: [
         Color(0xFFFFFFFF),
         Color(0xFFA86969),
         Color(0xFF4A0D0D),
      ]);

   static const Color textPrimary = Color(0xFF000000);
   static const Color textSecondary = Color(0xFFFFFFFF);

   static const Color light = Color(0xFFFFFFFF);
   static const Color dark = Color(0xFF272727);
   static const Color secondaryBackground = Color(0xFFF3F5FF);
   static const Color primaryBackground = Color(0xFF76B4E4);

   static const Color lightContainer = Color(0xFFFFFFFF);
   static const Color darkContainer = Color(0xFF000000);

   static const Color buttonPrimary = Color(0xFF76B4E4);
   static const Color buttonSecondary = Color(0xFF6c7570);
   static const Color buttonDisabled = Color(0xFFC4C4C4);

   static const Color borderPrimary = Color(0xFFFFFFFF);
   static  Color borderSecondary = Colors.white.withValues(alpha: 0.1);

   static const Color error = Color(0xFFC22424);
   static const Color success = Color(0xff12c86b);
   static const Color warning = Color(0xffeca722);
   static const Color info = Color(0xff0ca5df);

   static const Color black = Color(0xFF000000);
   static const Color darkerGrey = Color(0xff292929);
   static const Color darkGrey = Color(0xff393838);
   static const Color grey = Color(0xff555555);
   static const Color softGrey = Color(0xff7a7a7a);
   static const Color lightGrey = Color(0xffbababa);
   static const Color white = Color(0xFFFFFFFF);









 }