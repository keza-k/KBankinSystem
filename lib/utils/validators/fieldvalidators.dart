// import 'package:flutter/material.dart';

// class ValidationField extends StatefulWidget {
//   const ValidationField({super.key});

//   @override
//   State<ValidationField> createState() => _ValidationFieldState();
// }

// class _ValidationFieldState extends State<ValidationField> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Custom Validation Field")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   labelText: "Input field",
//                   border: const OutlineInputBorder(),
//                   errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
//                   errorBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.red, width: 2),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   focusedErrorBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.red, width: 2),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   suffixIcon: const Icon(Icons.error, color: Colors.red),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "This field cannot be empty.";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
