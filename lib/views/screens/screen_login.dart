import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:session_one/controllers/controller_login.dart';
import 'package:session_one/views/screens/screen_forgot_password.dart';
import 'package:session_one/views/screens/screen_home_page.dart';
import 'package:session_one/views/screens/screen_signup.dart';
import 'package:session_one/widgets/my_custom_button.dart';

import '../../widgets/my_input_feild.dart';

class ScreenLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ControllerLogin controllerLogin = Get.put(ControllerLogin());

    ///if you have Already put controller on previous Screen  then you can find controller
    ///ControllerLogin controllerLogin=Get.find<ControllerLogin>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          Text("Login", style: TextStyle(fontSize: 30.sp),),
          Obx(() {
            return MyInputField(
              readOnly: controllerLogin.loginLoading.value,
              controller: controllerLogin.controllerEmail,
              hint: "Email",
            );
          }).marginSymmetric(vertical: 8.sp),
          Obx(() {
            return MyInputField(
              readOnly: controllerLogin.loginLoading.value,
              controller: controllerLogin.controllerPassword,
              hint: "Password",
            );
          }).marginSymmetric(vertical: 8.sp),
          Row(
            children: [
              Obx(() {
                return Checkbox(
                  value: controllerLogin.isCheck.value,
                  onChanged: (newValue) {
                    controllerLogin.isCheck.value = newValue!;
                  },
                  checkColor: Colors.red,);
              }),
              TextButton(
                  onPressed: () {
                    Get.to(ScreenForgotPassword());
                  },
                  child: Text("Forgot Password")
              ),
            ],
          ),
          Obx(() {
            return MyCustomButton(text: "Login", onTap:controllerLogin.loginLoading.value?null: () async {
             String response=await controllerLogin.userLogin();
             if (response=="success") {
               Get.offAll(ScreenHomePage());
             }
             else{
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response)));
             }

            }, loading: controllerLogin.loginLoading.value,);
          }),
          MyCustomButton(
            text: "Sign Up",
            onTap: () {
              Get.to(ScreenSignup());
            },
            loading: false,
            textColor: Colors.red,

            buttonColor: Colors.grey.shade200,)

        ],
      ).marginSymmetric(vertical: 20.sp, horizontal: 18.sp),
    );
  }
}
