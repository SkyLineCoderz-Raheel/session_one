import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerSignup extends GetxController {
  /// Basically Three Controller to manage State of Variables
  /// GetX Controller => User Obs variable
  /// Obx Controller => Same Use Obs Variables
  /// GetBuilder Controller => Simple Variable and Need update method to update its state of Variable
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName= TextEditingController();
  RxBool signupLoading = false.obs;

  Future<String> userSignup() async {
    String response = "";
    signupLoading.value=true;

    String email = controllerEmail.text.trim();
    String password = controllerPassword.text.trim();
    String name = controllerName.text.trim();
    if (name.isNotEmpty&&email.isNotEmpty && password.isNotEmpty) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        response ="register";
       await value.user!.updateDisplayName(name);
        signupLoading.value=false;
      }).catchError((error){
        response =error.toString();
        signupLoading.value=false;
      });
    }

    else {
      signupLoading.value=false;
      response = "Name Email and Password required";
    }

    return response;
  }
}
