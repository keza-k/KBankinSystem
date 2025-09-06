import 'package:flutter/material.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:kbankinsystem/common/widgets/custom_shapes/curved_shapes/curved_edges_widget.dart';
import 'package:kbankinsystem/utils/constants/colors.dart';
class KPrimaryHeaderContainer extends StatelessWidget {
  const KPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
       child: Container(
        color: const Color.fromARGB(255, 55, 154, 230),
        padding: const EdgeInsets.all(0) ,
        child: SizedBox(
        height: 200,
        child: Stack(
        children: [
          Positioned(child: child),
          Positioned(  top: -190, right: -250,  child: KCircularContainer(backgroundColor: KColors.borderSecondary,)),
          Positioned(  top: -10, right: -250,  child: KCircularContainer(backgroundColor: KColors.borderSecondary,)),
    
              ],
            ),
            ),
          ),
    );
  }
}