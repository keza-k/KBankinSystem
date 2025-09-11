import 'dart:convert';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
import 'package:http/http.dart' as http;
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/sectionContainers/sections.dart';
import 'package:kbankinsystem/features/authentications/screens/OTPscreens/sendotp.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/home.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/landingpage.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/deposits.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/tranfer.dart';
import 'package:kbankinsystem/features/authentications/screens/transaction_forms/withdraw.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

// const String apiKey = "32QA3SUcA95VYKQDTve3Tk144ih_2YqEKv1NRR7yFKXFN9CRE"; // Replace with your secret key
const String baseUrl = 'https://842518902841.ngrok-free.app/banking';  // Replace with your Render URL

Map<String, String> get headers => {
  'Content-Type': 'application/json',
  // 'x-api-key': apiKey,
};
 bool obscure = true;

//logIn
Future<void> login(String email, String pin, BuildContext context) async{

  String balance = "";
  String accountNumber = "";
  List transactions = [];
  String message = "";

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/Credentials'),
      headers: <String, String>{
        'Content-Type':'application/json; charset=UTF-8'
      },
      body: json.encode({
        'email': email,
        'pin': pin,
        // 'name': name,
      }),
    );


      print("print we are here");

    var jsonResponse = jsonDecode(response.body);
     String? status = jsonResponse['status'];
     balance = jsonResponse['balance'].toString();
     accountNumber = jsonResponse['accountNumber'];
     transactions = jsonResponse['transactions'];
     message = jsonResponse['message'];

    print("I'm I herreee ??? === ${response.body}");

    if(status == "PASS"){
      Navigator.of(context).pop();
      // SnackBar(content: Text(response.body));

      final screen = await showDialog<int>(context: context, builder: (context) =>  AlertDialog(
        title:  Text(message, style: Theme.of(context).textTheme.bodyLarge,),

        actions: [
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Landingpage(balance: balance, transactions: transactions,)));}, child: Text(KTexts.kContinue)),
        ],
      ),
      );


    }
    else if(response.statusCode == 403){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${response.statusCode}"))
      );
    }
    else{
      Navigator.of(Get.context!).pop();
      SnackBar(content: Text("Error: Account not found"));
    }

    

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text("the error $e")),
    );
    Navigator.of(context).pop();
    // notOnlineMessage(Get.context!).show();
  }

}

//signUp
Future<void> signUp(String names, String email, String pin, String confirmPin, BuildContext context) async{

  try{
  final response = await http.post(
    Uri.parse('$baseUrl/addClients'),
    headers: <String, String>{
      'Content-Type':'application/json; charset=UTF-8'
    },
    body: json.encode({
      'names': names,
      'email': email,
      'pin': pin,
      'confirmPin': confirmPin,



    }),);
      if(response.statusCode == 200){
    print("I'm I herreee ??? === ${response.body}");
    Navigator.of(context).pop();
    SnackBar(content: Text(response.body));

    final screen = await showDialog<int>(context: context, builder: (context) =>  AlertDialog(
      title:  Text(response.body, style: Theme.of(context).textTheme.bodyLarge,),

      actions: [
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreenn(message: 'Your balance is 5000000', transactions: [], balance: "")));}, child: Text(KTexts.kContinue)),
      ],
    ),
    );


  }
      else if(response.statusCode == 403){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${response.statusCode}"))
        );
      }
      else{
        Navigator.of(Get.context!).pop();
        SnackBar(content: Text("Error: Account not found"));
      }



      } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("the error $e")),
      );
      Navigator.of(context).pop();
      // notOnlineMessage(Get.context!).show();
      }

      }

      //deposit
  // Future<void> deposit(String AccountNumber, int amount,  BuildContext context) async{
  //
  //   try{
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/deposit'),
  //       headers: <String, String>{
  //         'Content-Type':'application/json; charset=UTF-8'
  //       },
  //       body: json.encode({
  //
  //         'AccountNumber': AccountNumber,
  //         'amount': amount,
  //
  //
  //
  //       }),);
  //     if(response.statusCode == 200){
  //       print("I'm I herreee ??? === ${response.body}");
  //       Navigator.of(context).pop();
  //       SnackBar(content: Text(response.body,style: Theme.of(context).textTheme.bodyLarge,));
  //     }
  //     else if(response.statusCode == 403){
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Error: ${response.statusCode}"))
  //       );
  //     }
  //     else{
  //       Navigator.of(Get.context!).pop();
  //       SnackBar(content: Text("Error: Process Failed"));
  //     }
  //
  //
  //
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("the error $e")),
  //     );
  //     Navigator.of(context).pop();
  //     // notOnlineMessage(Get.context!).show();
  //   }
  //
  // }

  //deposit popUpScreen

  Future<void> depositPopUp(String pin, String AccountNumber, String amount,BuildContext context) async{
  print("In Deposits=====$amount $AccountNumber $pin");

    try{
      final response = await http.post(
        Uri.parse('$baseUrl/deposit'),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8'
        },
        body: json.encode({
          'transactionType': "DEPOSITS",
          // 'transactionID': "TX001",
          'accountNumber':AccountNumber,
          'amount':int.parse(amount),
          'pin': pin,
        }),

      );
      if(response.statusCode == 200){
        print("I'm I herreee ??? === ${response.body}");
        Navigator.of(context).pop();
        SnackBar(content: Text(response.body));

        final screen = await showDialog<int>(context: context, builder: (context) =>  AlertDialog(
          title:  Text(response.body),

          actions: [
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DepositForm()));}, child: Text(KTexts.next)),
          ],
        ),
        );

      }
      else{
        Navigator.of(Get.context!).pop();
        SnackBar(content: Text("Error: Process Failed"));
      }

    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("the error $e")),
      );
      Navigator.of(context).pop();
      // notOnlineMessage(Get.context!).show();
    }



    //withdraw popUpScreen
  }Future<void> withdrawPopUp(String pin,String AccountNumber, String amount, BuildContext context) async{
  print("Withdrawss======= $amount $AccountNumber $pin");
    try{
      final response = await http.post(
        Uri.parse('$baseUrl/Withdraw'),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8'
        },
        body: json.encode({
          'transactionType':"WITHDRAW",
          // 'transactionID': "TN001",
          'pin': pin,
          'accountNumber': AccountNumber,
          'amount': int.parse(amount),
        }),

      );
      if(response.statusCode == 200){
        print("I'm I herreee ??? === ${response.body}");
        Navigator.of(context).pop();
        SnackBar(content: Text(response.body, style: Theme.of(context).textTheme.bodyLarge,));

        final screen = await showDialog<int>(context: context, builder: (context) =>  AlertDialog(
          title:  Text(response.body, style: Theme.of(context).textTheme.bodyLarge,),

          actions: [
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> WithdrawForm()));}, child: Text(KTexts.next)),
          ],
        ),
        );

      }
      else{
        Navigator.of(Get.context!).pop();
        SnackBar(content: Text("Error: Process Failed"));
      }

    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("the error $e")),
      );
      Navigator.of(context).pop();
      // notOnlineMessage(Get.context!).show();
    }

    //transfer popUp
  }Future<void> transferPopUp(String AccountNumber,String receiverAccountNumber,String amount ,String pin, BuildContext context) async{

  print("pin======== $pin");

    try{
      final response = await http.post(
        Uri.parse('$baseUrl/Transfer'),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8'
        },
        body: json.encode({
          // 'id': "TUINN1",
          'transactionType': "TRANSFER",
          'amount': int.parse(amount),
          'accountNumber': AccountNumber,
          'receiverAccountNumber': receiverAccountNumber,
          'pin': pin
        }),

      );
      if(response.statusCode == 200){
        print("I'm I herreee ??? === ${response.body}");
        Navigator.of(context).pop();
        SnackBar(content: Text(response.body));

        final screen = await showDialog<int>(context: context, builder: (context) =>  AlertDialog(
          title:  Text(response.body, style: Theme.of(context).textTheme.bodyLarge,),

          actions: [
            ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> TransferForm()));}, child: Text(KTexts.next)),
          ],
        ),
        );

      }
      else{
        Navigator.of(Get.context!).pop();
        SnackBar(content: Text("Error: Process Failed"));
      }

    }catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("the error $e")),
      );
      Navigator.of(context).pop();
      // notOnlineMessage(Get.context!).show();
    }
  }












//findBalance
// Future<void> findBalance(String accountNumber, String pin, BuildContext context) async{
//   try{
//     final response = await http.post(
//       Uri.parse('$baseUrl/findBalance'),
//       headers: <String, String>{
//         'Content-Type':'application/json; charset=UTF-8'
//       },
//       body: json.encode({
//         'accountNumber': accountNumber,
//         'pin': pin,
//
//
//
//       }),);
//
//     if(response.statusCode == 200){
//       print("I'm I herreee ??? === ${response.body}");
//       Navigator.of(context).pop();
//       SnackBar(content: Text(response.body));
//
//       homesections(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               KTexts.balanceSectionTitle, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: const Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
//             const SizedBox(height: 0,),
//             Text(
//               obscure
//                   ? widget.message.replaceAll(RegExp(r"."), "*")
//                   : widget.message,
//               style: const TextStyle(fontSize: 20),
//             ),
//
//             IconButton(
//               icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
//               onPressed: () {
//                 setState(() {
//                   obscure = !obscure;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     }
//     else if(response.statusCode == 403){
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error: ${response.statusCode}"))
//       );
//     }
//     else{
//       Navigator.of(Get.context!).pop();
//       SnackBar(content: Text("Error: Process Failed"));
//     }
//
//
//
//   }
//   catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("$e")),
//     );
//     Navigator.of(context).pop();
//     // notOnlineMessage(Get.context!).show();
//   }
//
// }





