import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:session_one/models/user_model.dart';

class ControllerSignup extends GetxController {
  /// Basically Three Controller to manage State of Variables
  /// GetX Controller => User Obs variable
  /// Obx Controller => Same Use Obs Variables
  /// GetBuilder Controller => Simple Variable and Need update method to update its state of Variable
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerEducation = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  RxBool signupLoading = false.obs;

  Future<String> userSignup() async {
    String response = "";
    signupLoading.value = true;

    String email = controllerEmail.text.trim();
    String education = controllerEducation.text.trim();
    String address = controllerAddress.text.trim();
    String gender = controllerGender.text.trim();
    String phone = controllerPhone.text.trim();
    String password = controllerPassword.text.trim();
    String name = controllerName.text.trim();
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty&&address.isNotEmpty) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        response = "register";
        UserModel userModel = UserModel(
            id: value.user!.uid,
            name: name,
            education: education,
            address: address,
            gender: gender,
            phone: phone);

         await FirebaseFirestore.instance.collection("users").doc(value.user!.uid).set(userModel.toMap()).then((value) async {
           var user = FirebaseAuth.instance.currentUser;
           await user!.updateDisplayName(name);
           signupLoading.value = false;
         }).catchError((error){
           signupLoading.value = false;

           response=error.toString();
         });

      }).catchError((error) {
        response = error.toString();
        signupLoading.value = false;
      });
    } else {
      signupLoading.value = false;
      response = "Name Email and Password required";
    }

    return response;
  }
}
