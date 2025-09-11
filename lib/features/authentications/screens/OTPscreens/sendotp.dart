import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/landingpage.dart';
import 'package:kbankinsystem/features/authentications/screens/login/login.dart';
import 'package:kbankinsystem/utils/validators/kvalidators.dart';

class Verifyingotp extends StatelessWidget {
  const Verifyingotp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController otpController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    
    return Scaffold(
      appBar: AppBar(title: const Text('Email OTP')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        children: [
      Form(
        key: formKey,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
        TextFormField(
        validator: (value) => KValidator.validateEmail(value),
        controller: emailController,
        decoration: const InputDecoration(
          labelText: "Enter Email",
          // border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      
        ElevatedButton(
            onPressed: () async {
              if (await EmailOTP.sendOTP(email: emailController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("OTP has been sent")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("OTP failed to send")));
              }
            },
            child: const Text('  Send OTP  '),

          ),
          SizedBox(height: 16),
          TextFormField(
            // validator: (value) => KValidator.validateOTP(value),
            controller: otpController,
            decoration: const InputDecoration(
            labelText: "Enter OTP",
            // border: OutlineInputBorder(),
            ),
           ), 
            SizedBox(height: 16),
          
     
           ElevatedButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) {
                                return;
                                }
              bool verified = EmailOTP.verifyOTP(otp: otpController.text);
              
              if (verified) {
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> LoginScreen())
                            );         
                         ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("OTP verified successfully!")),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Invalid OTP, try again")),
                );
              }
            },
            child: const Text('  Verify OTP  '),
          ),  
          SizedBox(height: 20), 

          ],
        ),
        ),
        ),
          
          ],
      ),
      ),
    );
  }
}




// EmailOTP.setTemplate(
  //   template: '''
  //   <div style="background-color: #f4f4f4; padding: 20px; font-family: Arial, sans-serif;">
  //     <div style="background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
  //       <h1 style="color: #333;">{{appName}}</h1>
  //       <p style="color: #333;">Your OTP is <strong>{{otp}}</strong></p>
  //       <p style="color: #333;">This OTP is valid for 5 minutes.</p>
  //       <p style="color: #333;">Thank you for using our service.</p>
  //     </div>
  //   </div>
  //   ''',
  // );