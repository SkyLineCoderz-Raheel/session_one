import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session_one/views/screens/screen_future_document.dart';
import 'package:session_one/views/screens/screen_future_query.dart';
import 'package:session_one/views/screens/screen_login.dart';
import 'package:session_one/views/screens/screen_stream_document.dart';
import 'package:session_one/views/screens/screen_stream_query.dart';

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
          TextButton(onPressed: (){
            Get.to(ScreenFutureDocument());
          }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal:20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.yellow
            ),
            child: Text("Future Document Snapshot"),
          )),
          TextButton(onPressed: (){
            Get.to(ScreenFutureQuery());
          }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal:20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.yellow
            ),
            child: Text("Future Query Snapshot"),
          )),
          TextButton(onPressed: (){
            Get.to(ScreenStreamDocument());
          }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal:20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.yellow
            ),
            child: Text("Stream Document Snapshot"),
          )),
          TextButton(onPressed: (){
            Get.to(ScreenStreamQuery());
          }, child: Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal:20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.yellow
            ),
            child: Text("Stream Query Snapshot"),
          )),
          Text(FirebaseAuth.instance.currentUser!.displayName!),
          Text(FirebaseAuth.instance.currentUser!.email!),
          Text(FirebaseAuth.instance.currentUser!.uid!),


        ],
      ),
    );
  }
}
