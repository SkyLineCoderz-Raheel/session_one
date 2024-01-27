import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session_one/views/screens/screen_login.dart';

class ScreenHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed: () async {
            await FirebaseAuth.instance.signOut().then((value) {
              Get.offAll(ScreenLogin());
            }).catchError((error){
              Get.snackbar("alert", error.toString());
            });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(FirebaseAuth.instance.currentUser!.displayName!),
          Text(FirebaseAuth.instance.currentUser!.email!),
          Text(FirebaseAuth.instance.currentUser!.uid!),


        ],
      ),
    );
  }
}
