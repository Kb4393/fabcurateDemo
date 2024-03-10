import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/base_color.dart';
import '../utils/base_text.dart';

class CurateScreen extends StatefulWidget {
  const CurateScreen({super.key});

  @override
  State<CurateScreen> createState() => _CurateScreenState();
}

class _CurateScreenState extends State<CurateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: baseText(
          "Curate Screen",
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: BaseColor.appColor,
        ),
      ),
    );
  }
}
