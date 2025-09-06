import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/appbar/appbar.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/popUpScreen.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  _TransferFormState createState() => _TransferFormState();
}
class _TransferFormState extends State<TransferForm>{
  bool obscureText = true;

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText:KTexts.senderaccountnumber ,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                      width: 50,),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: KTexts.receiveraccountnumber,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                      width: 50,
                    
                    ),


                    TextFormField(
                      decoration: InputDecoration(
                        labelText: KTexts.Tamount,
                      ),
                      keyboardType: TextInputType.number,
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
                          final number = await showDialog<int>(
                          context: context,
                          builder: (context) =>  NumberInputDialog(
                            title: KTexts.popTransfer,
                          ),
                         );

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