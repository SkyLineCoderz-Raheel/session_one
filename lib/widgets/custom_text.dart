import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  TextOverflow? textOverflow;
  int? maxLine;
  double? size;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight?? FontWeight.w400,
        fontSize: size ?? 14,
        fontFamily: 'Montserrat',
        color: color ?? Colors.black,


      ),
      textAlign:textAlign??  TextAlign.center,
      maxLines: maxLine,
      overflow: textOverflow,
    );
  }

  CustomText({
    required this.text,
    this.color,
     this.textOverflow,
     this.maxLine,
    this.size,
    this.fontWeight,
    this.textAlign,
  });
}
