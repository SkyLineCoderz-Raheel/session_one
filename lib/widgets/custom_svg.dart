import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
String? name;
double? height;
double? width;
Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/icons/$name.svg",color: color,height: height,width: width,);
  }

CustomSvg({
     this.name,
     this.color,
     this.height,
     this.width,
  });
}
