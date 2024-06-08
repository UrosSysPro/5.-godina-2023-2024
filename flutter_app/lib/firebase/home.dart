import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({super.key,required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var auth=FirebaseAuth.instance;
  var db=FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.collection("users").doc(widget.user.uid).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: Text("Waiting..."),);
          }
          if(snapshot.data==null){
            return Center(child: FilledButton(
              onPressed: ()async{
                await db.collection("users").doc(widget.user.uid).set({
                  "username":widget.user.displayName,
                  "email":widget.user.email
                });
              },
              child: Text("Create user"),
            ),);
          }
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: NetworkImage(widget.user.photoURL??""),
                    errorBuilder: (context, error, stackTrace) => FlutterLogo(),
                  ),
                  Text(widget.user.displayName??"user name"),
                  Text(widget.user.email??"email"),
                  Text(widget.user.uid)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
