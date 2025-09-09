import 'dart:convert';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
import 'package:http/http.dart' as http;

// const String apiKey = "32QA3SUcA95VYKQDTve3Tk144ih_2YqEKv1NRR7yFKXFN9CRE"; // Replace with your secret key
const String baseUrl = 'http://localhost:8080/banking';  // Replace with your Render URL

Map<String, String> get headers => {
  'Content-Type': 'application/json',
  // 'x-api-key': apiKey,
};

Future<String?> login(String email, String pin, String name, BuildContext context) async{
  // showDialog(
  //   context: Get.context!,
  //   barrierDismissible: false,
  //   builder: (BuildContext context) {
  //     return const Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   },
  // );
  // String? email;
  // String? pin;
  // String? name;
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/Credentials'),
      headers: <String, String>{
        'Content-Type':'application/json; charset=UTF-8'
      },
      body: json.encode({
        'email': email,
        'pin': pin,
        'name': name,
      }),
    );
      print("print we are here");

    var jsonResponse = jsonDecode(response.body);
    String? status = jsonResponse['status'];

    if(status == "found"){
      Navigator.of(Get.context!).pop();
      return 'Welcome $name, Succeccfully logged in!';
    }
    else if(response.statusCode == 403){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${response.statusCode}"))
      );
    }
    else{
      Navigator.of(Get.context!).pop();
      return "Account not found";
    }

    

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text("the error $e")),
    );
    Navigator.of(Get.context!).pop();
    // notOnlineMessage(Get.context!).show();
  }
  return null;
}





