import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/appbar/appbar.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/popUpScreen.dart';
import 'package:kbankinsystem/utils/helpers/helper_functions.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';
import 'package:kbankinsystem/utils/validators/kvalidators.dart';

class DepositForm extends StatefulWidget {
  const DepositForm({super.key});

  @override
  _DepositFormState createState() => _DepositFormState();
}

class _DepositFormState extends State<DepositForm>{
  final _formKey = GlobalKey<FormState>();
  var accountController = TextEditingController(); 
  var amountController = TextEditingController();
  bool obscureText = true;

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
                    child: Text(KTexts.depositTitle, style: Theme.of(context).textTheme.headlineMedium?.
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
                      controller: accountController,
                      decoration: InputDecoration(
                        labelText: KTexts.accountNumber,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20,
                      width: 50,),

                    TextFormField(
                      validator: (value) => KValidator.validateAmount(value),
                      controller: amountController,
                      decoration: InputDecoration(
                        labelText: KTexts.Damount,
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
                          if (!_formKey.currentState!.validate()) {
                            return;
                           }
                          final number = await showDialog<int>(
                          context: context,
                          builder: (context) => const NumberInputDialog(
                            title: KTexts.popDeposit, 
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