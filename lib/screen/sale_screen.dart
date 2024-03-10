import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/base_color.dart';
import '../utils/base_text.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: baseText(
          "Sale Screen",
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: BaseColor.appColor,
        ),
      ),
    );
  }
}
