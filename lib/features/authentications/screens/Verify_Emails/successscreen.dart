import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/styles/spacing_styles.dart';
import 'package:kbankinsystem/features/authentications/screens/login/login.dart';
import 'package:kbankinsystem/utils/constants/sizes.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class Successscreen extends StatelessWidget {
  const Successscreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Text(KTexts.accountCreatedTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height:KSizes.spaceBetweenItems),

              Text(KTexts.accountCreatedSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height:KSizes.spaceBetweenItems),

              SizedBox( width: double.infinity, child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));}, child: Text(KTexts.kContinue)),),
              const SizedBox(height:KSizes.spaceBetweenItems),


            ],
          ),
          )
      ),
    );
  }
}