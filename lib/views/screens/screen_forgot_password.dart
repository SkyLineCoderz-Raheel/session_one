import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:session_one/widgets/my_custom_button.dart';

import '../../widgets/my_input_feild.dart';
class ScreenForgotPassword extends StatelessWidget {
  const ScreenForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Column(
        children: <Widget>[
          Text("Login"),
          MyInputField(
            hint: "Email",
          ).marginSymmetric(vertical: 8.sp),

          MyCustomButton(text: "Forgot", onTap: (){}, loading: false)

        ],
      ).marginSymmetric(vertical: 20.sp,horizontal: 18.sp),
    );

  }
}
