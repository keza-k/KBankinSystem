import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/appbar/appbar.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kbankinsystem/features/authentications/controllers/controllers.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/popUpScreen.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';
import 'package:kbankinsystem/utils/validators/kvalidators.dart';

class WithdrawForm extends StatefulWidget {
  const WithdrawForm({super.key});

  @override
  _WithdrawFormState createState() => _WithdrawFormState();
}
class _WithdrawFormState extends State<WithdrawForm>{
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var accountController = TextEditingController(); 
  var amountController = TextEditingController();

  bool obscureText = true;
  String accountNumber = "";
  String amount = "";

  @override
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
                    child: Text(KTexts.withdrawTitle, style: Theme.of(context).textTheme.headlineMedium?.
                          copyWith(color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,)),


                            ),


                             ],
          ),
            ),
             
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // 20 pixels from left & right
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) => KValidator.validateAccountNumber(value),
                      controller: accountController,
                      decoration: InputDecoration(
                      labelText: KTexts.accountNumber,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        accountNumber = value;
                      }
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) => KValidator.validateAmount(value),
                      controller: amountController,
                      decoration: InputDecoration(
                      labelText: KTexts.Wamount,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      amount = value;
                    }
                    ),
                   const SizedBox(height: 20),
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
                                builder: (context) => popWith(
                                title: KTexts.popWithdraw, accountNumber: accountNumber, amount: amount,
                               
                                ),
                                
                              );
                                //
                            
                            },
                            
                            child: const Text(KTexts.sendButton),
                          ),
                         ),
                       ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
               ),
              )
           
          ],
          ),
      ),
    );
}
}