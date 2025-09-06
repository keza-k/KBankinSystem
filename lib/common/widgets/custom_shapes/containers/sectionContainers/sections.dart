import 'package:flutter/material.dart';

class homesections extends StatelessWidget {
  const homesections({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 206, 206),
        borderRadius: BorderRadius.circular(12),
      ),

      child: child,
    );


  }
}