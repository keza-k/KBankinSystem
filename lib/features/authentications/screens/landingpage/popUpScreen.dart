import 'package:flutter/material.dart';
import 'package:kbankinsystem/utils/themes/custom_themes/texts.dart';

class NumberInputDialog extends StatefulWidget {
  const NumberInputDialog({super.key, required this.title});

  final String title;

  @override
  State<NumberInputDialog> createState() => _NumberInputDialogState();
}



class _NumberInputDialogState extends State<NumberInputDialog> {
  final TextEditingController _controller = TextEditingController();
  bool obscureText = true;

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
            if (_controller.text.isNotEmpty) {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
