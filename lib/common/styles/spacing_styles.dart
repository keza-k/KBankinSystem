import 'package:flutter/material.dart';
import 'package:kbankinsystem/utils/constants/sizes.dart';

class KSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: KSizes.appBarHeight,
    left: KSizes.defaultSpacing,
    bottom: KSizes.defaultSpacing,
    right: KSizes.defaultSpacing,
  );
}