import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/screens/signup/signup.dart';
import 'package:kbankinsystem/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: KBankingTheme.lightTheme ,
      darkTheme: KBankingTheme.darkTheme,
      home: SignupScreen(),
      

    );
  }
}