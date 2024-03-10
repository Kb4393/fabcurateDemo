import 'package:fabcurate/utils/strings.dart';
import 'package:flutter/material.dart';

import 'base_color.dart';

Text baseText(
  String text, {
  FontStyle? fontStyle,
  Color? color = BaseColor.black,
  double? fontSize = 16,
  FontWeight? fontWeight = FontWeight.normal,
  double? letterSpacing = 0.0,
  TextAlign? textAlign = TextAlign.start,
  int? maxLines,
  TextOverflow textOverflow = TextOverflow.ellipsis,
  TextDecoration? textDecoration,
  TextStyle? textStyle,
  Color? decorationColor,
  String? fontFamily = BaseStrings.inter,
  bool softWrap = false,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: textOverflow,
    softWrap: softWrap,
    style: textStyle ??
        TextStyle(
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          color: color,
          decoration: textDecoration,
          decorationStyle: TextDecorationStyle.solid,
          fontSize: fontSize!,
          fontWeight: fontWeight,
          decorationColor: decorationColor,
          letterSpacing: letterSpacing!,
        ),
  );
}
