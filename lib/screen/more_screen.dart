import 'package:fabcurate/utils/base_color.dart';
import 'package:fabcurate/utils/base_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: baseText(
          "More Screen",
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: BaseColor.appColor,
        ),
      ),
    );
  }
}
