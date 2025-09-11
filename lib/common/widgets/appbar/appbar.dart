import 'package:flutter/material.dart';
import 'package:kbankinsystem/features/authentications/screens/landingpage/landingpage.dart';
import 'package:kbankinsystem/utils/device/device_utility.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
  super.key,
  this.title,
  this.actions,
  this.leadingIcon, 
  this.leadingOnPressed,
  this.showBackArrow = true, required Padding child,
  this.showPersonIcon = true 

  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool showPersonIcon;
  

  

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      automaticallyImplyLeading: false,
      // leading: showBackArrow,
      // ?IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Landingpage()));}, icon: const Icon(Icons.arrow_back))
      // : leadingIcon!=null? IconButton(onPressed: leadingOnPressed, icon:  Icon(leadingIcon)): null,
      //

      title: title,
      actions: actions,
    );
    
  }
  
  @override
  Size get preferredSize => Size.fromHeight(KDeviceUtilityAppBar.getAppBarHeight());
}