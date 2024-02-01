import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:session_one/models/user_model.dart';

class ScreenFutureQuery extends StatelessWidget {
  const ScreenFutureQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Query"),
      ),
      body: FutureBuilder<QuerySnapshot>(future: FirebaseFirestore.instance.collection("users").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Text("Some thing wrong");
        }
        List<UserModel> userModelList=snapshot.data!.docs.map((e) => UserModel.fromMap(e.data() as Map<String,dynamic>)).toList();

       ///where condition
        userModelList=userModelList.where((e) => e.id!=FirebaseAuth.instance.currentUser!.uid).toList();
        return userModelList.isEmpty?Text("No Users found"):ListView.builder(
          itemCount: userModelList.length,
          itemBuilder: (BuildContext context, int index) {
            UserModel userModel=userModelList[index];
          return ListTile(
            title: Text(userModel.name),
            subtitle: Text(userModel.phone),
          );
        },);
      },
      ),
    );
  }
}
