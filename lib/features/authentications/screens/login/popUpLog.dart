import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/landingpage.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class loginPop extends StatefulWidget {
  const loginPop({super.key});

  @override
  State<loginPop> createState() => _loginPopState();
  
}

class _loginPopState extends State<loginPop> {
  final TextEditingController _controller = TextEditingController();
  bool obscureText = true;

   @override
  void dispose() {
    _controller.dispose(); // cleanup
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(KTexts.popLogin),

      actions: [
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Landingpage()));}, child: Text(KTexts.kContinue)),
      ],
    );
  }
}