import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:session_one/models/user_model.dart';

class ScreenFutureDocument extends StatelessWidget {
var id=FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Document"),
      ),
      body: FutureBuilder<DocumentSnapshot>(future: FirebaseFirestore.instance.collection("users").doc(id).get(),
        builder: (BuildContext context,  snapshot) {
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }else if (snapshot.hasError) {
          return Center(child: Text("something"));
        }
        UserModel userModel=UserModel.fromMap(snapshot.data!.data() as Map<String,dynamic>);
        return ListTile(
          title: Text(userModel.name),
          subtitle: Text(userModel.phone),

        );
        },),
    );
  }
}
