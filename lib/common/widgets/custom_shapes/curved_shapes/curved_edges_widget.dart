import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/curved_shapes/curved_edges.dart';

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    this.child, 
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: KCustomCurvedEdges(),
      child: child,
    );
  }
}