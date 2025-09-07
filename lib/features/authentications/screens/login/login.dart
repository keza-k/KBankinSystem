import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/styles/spacing_styles.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/landingpage.dart';
import 'package:kbankinsystem/features/authentications/screens/signup/signup.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';
import 'package:kbankinsystem/utils/validators/kvalidators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginScreen>{
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  var pinController = TextEditingController();
  var emailController = TextEditingController(); 



  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                KTexts.loginTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                KTexts.loginSubTitle, 
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              /// Form
              Form(
                 key: _formKey,
                child: Column(
                  children: [
                    /// Email
                    TextFormField(
                      validator: (value) => KValidator.validateEmail(value),
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    /// Password
                    TextFormField(
                      validator: (value) => KValidator.validateEmail(value),
                      controller: pinController,
                    decoration: InputDecoration(
                      labelText: "Pin",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton( 
                      icon: 
                      Icon(obscureText? Icons.visibility_off: Icons.visibility,),
                      onPressed: (){
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    ),
                    obscureText: obscureText,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 40),

                    /// Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Add forgot password navigation
                        },
                        child: const Text("Forgot Password?"),
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// Login button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                                return;
                                }
                           Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=> Landingpage())
                            );
                        },
                        child: const Text(KTexts.loginUpbutton),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade400)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("or"),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade400)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// Create account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=> SignupScreen())
                            );
                          },
                          child: const Text("Sign up"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
