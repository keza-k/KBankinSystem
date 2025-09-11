import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/controllers/controllers.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class NumberInputDialog extends StatefulWidget {
  const NumberInputDialog({super.key, required this.title, required this.accountNumber, required this.amount});

  final String title;
  final String accountNumber;
  final String amount;

  

  @override
  State<NumberInputDialog> createState() => _NumberInputDialogState();
}



class _NumberInputDialogState extends State<NumberInputDialog> {
  final TextEditingController _controller = TextEditingController();
  bool obscureText = true;
  // int amount = -1;
  String pin = "";


  @override
  void dispose() {
    _controller.dispose(); // cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge,),
      content: TextFormField(
        
                    decoration: InputDecoration(
                      
                      // labelText: KTexts.pin,
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
        onChanged: (value){
                      pin = value;
      }


                  ),
                  
      actions: [
        
        TextButton(
          child: const Text(KTexts.cancel),
          onPressed: () {
            Navigator.of(context).pop(); // just close
          },
        ),
        TextButton(
          child: const Text(KTexts.ok),
          onPressed: () {
            depositPopUp(pin,widget.accountNumber,widget.amount, context);
            // if (_controller.text.isNotEmpty) {
            //   Navigator.of(context).pop();
            // }
            
          },
          
        ),
        
      ],
    );
  }
}


//Withdrawwww
class popWith extends StatefulWidget {
  const popWith({super.key, required this.title, required this.accountNumber, required this.amount, });

  final String title;
  final String accountNumber;
  final String amount;


  @override
  State<popWith> createState() => _popWithState();
}



class _popWithState extends State<popWith> {
  final TextEditingController _controller = TextEditingController();
  bool obscureText = true;
  // int amount = -1;
  String pin = "";

  @override
  void dispose() {
    _controller.dispose(); // cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge,),
      content: TextFormField(

        decoration: InputDecoration(

          // labelText: KTexts.pin,
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
          onChanged: (value){
            pin = value;
          }
      ),

      actions: [

        TextButton(
          child: const Text(KTexts.cancel),
          onPressed: () {
            Navigator.of(context).pop(); // just close
          },
        ),
        TextButton(
          child: const Text(KTexts.ok),
          onPressed: () {
            withdrawPopUp(pin,widget.accountNumber, widget.amount, context);
            // if (_controller.text.isNotEmpty) {
            //   Navigator.of(context).pop();
            // }

          },

        ),

      ],
    );
  }
}



//Transferrrrr
class popTrans extends StatefulWidget {
  const popTrans({super.key, required this.title, required this.receiverAccountNumber, required this.amount, required this.senderAccountNumber, });

  final String title;
  final String receiverAccountNumber;
  final String amount;
  final String senderAccountNumber;


  @override
  State<popTrans> createState() => _popTransState();
}



class _popTransState extends State<popTrans> {
  final TextEditingController _controller = TextEditingController();
  bool obscureText = true;
  String pin = "";


  @override
  void dispose() {
    _controller.dispose(); // cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge,),
      content: TextFormField(

                    decoration: InputDecoration(

                      // labelText: KTexts.pin,
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
                    onChanged: (value){
                      pin = value;
                    }
                  ),

      actions: [

        TextButton(
          child: const Text(KTexts.cancel),
          onPressed: () {
            Navigator.of(context).pop(); // just close
          },
        ),
        TextButton(
          child: const Text(KTexts.ok),
          onPressed: () {
            // transferPopUp( widget.receiverAccountNumber, widget.senderAccountNumber, widget.amount, pin, context);
            transferPopUp( widget.senderAccountNumber, widget.receiverAccountNumber, widget.amount, pin, context);
            // if (_controller.text.isNotEmpty) {
            //   Navigator.of(context).pop();
            // }

          },

        ),

      ],
    );
  }
}

