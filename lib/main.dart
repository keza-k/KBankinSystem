import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:kbankinsystem/app.dart';
// import 'package:kbankinsystem/utils/themes/theme.dart';

// void main() {
//   EmailOTP.config(
//     appName: 'K Banking',
//     otpType: OTPType.numeric,
//     emailTheme: EmailTheme.v3,
//     expiry: 300000,
//     appEmail: 'kezatrinity6@gmail.com',
//     otpLength: 6
//   );

void main() {
  EmailOTP.config(
    appName: 'App Name',
    otpType: OTPType.numeric,
    expiry : 30000,
    emailTheme: EmailTheme.v3,
    appEmail: 'me@rohitchouhan.com',
    otpLength: 6,
  );


  // EmailOTP.setSMTP(
  //   host: 'Keza',
  //   emailPort: EmailPort.port587,
  //   secureType: SecureType.tls,
  //   username: 'kezatrinity6@gmail.com',
  //   password: 'nooi pssl gwda ldfs',
  // );

  runApp(const App());
}



