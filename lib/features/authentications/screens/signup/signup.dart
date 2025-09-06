import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/styles/spacing_styles.dart';
import 'package:kbankinsystem/features/authentications/screens/Verify_Emails/verify_emailScreen.dart';
import 'package:kbankinsystem/features/authentications/screens/login/login.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupScreen>{
  bool obscureText = true;

   @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView (
        child: Padding(
          padding:KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                KTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),


              Text(
                KTexts.signupSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Full Names",
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email'
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Pin",
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),

                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     labelText: "Confirm Pin ",
                    //     suffixIcon: Icon(Icons.visibility_off),
                    //   ),
                    //    obscureText: true,
                    // ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                         Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=> VerifyEmailscreen())
                            );
                        },
                      child: Text(KTexts.signUpbutton)),

                    ),
                    const SizedBox(height: 20),
                  
                  
                   Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade400)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(KTexts.or),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade400)),
                      ],
                    ),
                    const SizedBox(height: 20),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(KTexts.alreadyHaveAccount),
                        TextButton(
                          onPressed: () { 
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=> LoginScreen())
                            );
                          },
                          child: const Text("Log in"),
                        )
                        ],
                      ),
                  

                    ],
                  )
                )

              ],
            ), 
          ),
      ),
    );
  }

}
