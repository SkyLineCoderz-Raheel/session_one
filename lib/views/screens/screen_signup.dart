import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:session_one/controllers/controller_signup.dart';
import 'package:session_one/views/screens/screen_home_page.dart';
import 'package:session_one/widgets/my_custom_button.dart';

import '../../widgets/my_input_feild.dart';

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerSignup controllerSignup = Get.put(ControllerSignup());
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Sign up", style: TextStyle(fontSize: 30.sp),),
            Obx(() {
              return MyInputField(
                controller: controllerSignup.controllerName,
                readOnly: controllerSignup.signupLoading.value,
                hint: "Name",
              );
            }).marginSymmetric(vertical: 8.sp),
            Obx(() {
              return MyInputField(
                controller: controllerSignup.controllerEducation,
                readOnly: controllerSignup.signupLoading.value,
                hint: "Education",
              );
            }).marginSymmetric(vertical: 8.sp),
            Obx(() {
              return MyInputField(
                controller: controllerSignup.controllerAddress,
                readOnly: controllerSignup.signupLoading.value,
                hint: "Address",
              );
            }).marginSymmetric(vertical: 8.sp),
            Obx(() {
              return MyInputField(
                controller: controllerSignup.controllerPhone,
                readOnly: controllerSignup.signupLoading.value,
                hint: "Phone",
              );
            }).marginSymmetric(vertical: 8.sp),
            Obx(() {
              return MyInputField(
                controller: controllerSignup.controllerGender,
                readOnly: controllerSignup.signupLoading.value,
                hint: "Gender",
              );
            }).marginSymmetric(vertical: 8.sp),
            Obx(() {
              return MyInputField(
                controller: controllerSignup.controllerEmail,
                readOnly: controllerSignup.signupLoading.value,
                hint: "Email",
              );
            }).marginSymmetric(vertical: 8.sp),
            Obx(() {
              return MyInputField(
                hint: "Password",
                controller: controllerSignup.controllerPassword,
                readOnly: controllerSignup.signupLoading.value,
              );
            }).marginSymmetric(vertical: 8.sp),

            Obx(() {
              return MyCustomButton(text: "Sign Up",
                  onTap: controllerSignup.signupLoading.value
                      ? null
                      : () async {
                    String response = await controllerSignup.userSignup();
                    if (response == "register") {
                      Get.offAll(ScreenHomePage());
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response)));
                    }
                  },
                  loading: controllerSignup.signupLoading.value);
            }),
            MyCustomButton(
              text: "Login",
              onTap: () {
                Get.back();
              },
              loading: false,
              textColor: Colors.red,

              buttonColor: Colors.grey.shade200,
            )

          ],
        ).marginSymmetric(vertical: 20.sp, horizontal: 18.sp),
      ),
    );
  }
}
