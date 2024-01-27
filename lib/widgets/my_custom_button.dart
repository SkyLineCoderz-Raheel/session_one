import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:session_one/helpers/constant.dart';


class MyCustomButton extends StatelessWidget {
  String text;
  double? fontSize;
  Callback? onTap;
  bool? isRound;
  double? width;
  double? height;
  EdgeInsetsGeometry? margin;
  Color? buttonColor;
  Color? textColor;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        alignment: Alignment.center,
        height: height ?? 55,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: isRound == true
              ? BorderRadius.circular(30)
              : BorderRadius.circular(10),
          color: buttonColor ?? Constant().appColor,
        ),
        child: loading
            ? Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                    fontSize: fontSize ?? 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w700,
                    color: textColor ?? Colors.white),
              ),
      ),
    );
  }

  MyCustomButton({
    required this.text,
    this.fontSize,
     this.onTap,
    this.isRound,
    this.width,
    this.height,
    this.margin,
    this.buttonColor,
    this.textColor,
    required this.loading,
  });
}
