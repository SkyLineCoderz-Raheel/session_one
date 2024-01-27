import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  String? name;
  double? height, width;
  BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$name.png",
      height: height,
      width: width,
      fit: BoxFit.cover ?? boxFit,
    );
  }

  CustomImage({
    this.name,
    this.width,
    this.height,
    this.boxFit,
  });
}
