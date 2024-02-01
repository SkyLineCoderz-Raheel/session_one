import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class ScreenStreamQuery extends StatelessWidget {
  const ScreenStreamQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Query"),
      ),
      body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("users").snapshots(),
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
    );;
  }
}
