import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/screens/OTPscreens/sendotp.dart';
import 'package:kbankinsystem/features/authentications/screens/signup/signup.dart';
import 'package:kbankinsystem/utils/constants/sizes.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class VerifyEmailscreen extends StatelessWidget {
  const VerifyEmailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen()));}, icon: Icon(CupertinoIcons.clear),)
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpacing),
          child: Column(
            children: [

              Text(KTexts.verifyEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height:KSizes.spaceBetweenItems),

              Text('support@codingwithk.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height:KSizes.spaceBetweenItems),

              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Verifyingotp()));}, child: Text(KTexts.kContinue)),),
              const SizedBox(height:KSizes.spaceBetweenItems),

              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: Text(KTexts.resendCode)),),
              const SizedBox(height:KSizes.spaceBetweenItems),

               
            ],
          ),
        ),
      ),
    );
  }
}