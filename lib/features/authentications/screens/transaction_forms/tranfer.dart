import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/appbar/appbar.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kbankinsystem/features/authentications/controllers/controllers.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/popUpScreen.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';
import 'package:kbankinsystem/utils/validators/kvalidators.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  _TransferFormState createState() => _TransferFormState();
}
class _TransferFormState extends State<TransferForm>{
  final _formKey = GlobalKey<FormState>();
  var senderAccountController = TextEditingController();
  var receiverAccountController = TextEditingController();
  var amountController = TextEditingController();
  bool obscureText = true;
  String senderAccountNumber = "";
  String receiverAccountNumber = "";
  String amount = "";

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KPrimaryHeaderContainer(
            child:  Column(
            children: [
              KAppBar(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                      ),
                    ),
                  ),

                  Positioned(
                    child: Text(KTexts.trasferTitle, style: Theme.of(context).textTheme.headlineMedium?.
                          copyWith(color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,)),


                            ),


                             ],
          ),
            ),
             
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:Column(
                  children: [
                    TextFormField(
                      validator: (value) => KValidator.validateAccountNumber(value),
                      controller: senderAccountController,
                      decoration: InputDecoration(
                        labelText:KTexts.senderaccountnumber ,
                      ),
                      keyboardType: TextInputType.number,
                        onChanged: (value){
                          senderAccountNumber = value;
                        }
                    ),
                    SizedBox(
                      height: 20,
                      width: 50,),

                    TextFormField(
                       validator: (value) => KValidator.validateAccountNumber(value),
                      controller: receiverAccountController,
                      decoration: InputDecoration(
                        labelText: KTexts.receiveraccountnumber,
                      ),
                      keyboardType: TextInputType.number,
                        onChanged: (value){
                          receiverAccountNumber = value;
                        }
                    ),
                    SizedBox(
                      height: 20,
                      width: 50,
                    
                    ),


                    TextFormField(
                       validator: (value) => KValidator.validateAmount(value),
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: KTexts.Tamount,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value){
                         amount = value;
                      }
                    ),
                    SizedBox(
                      height: 20,
                      width: 40,
                    ),

                    


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        SizedBox(
                        width: 70,
                        child: ElevatedButton(
                      onPressed: () async {
                           if (!_formKey.currentState!.validate()) {
                            return;
                           }
                          final number = await showDialog<int>(
                          context: context,
                          builder: (context) =>  popTrans(
                            title: KTexts.popTransfer, senderAccountNumber: senderAccountNumber, amount: amount, receiverAccountNumber: receiverAccountNumber,
                          ),
                         );

                           // transfer(senderAccountNumber, receiverAccountNumber, amount, context);
                           //
                           // final screen = await showDialog<int>(
                           //   context: context,
                           //   builder: (context) => popUpNoti(title: KTexts.transfers,),
                           // );

                      },
                      child: const Text(KTexts.sendButton),
                    ),
                        
                         ),
                      ],
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