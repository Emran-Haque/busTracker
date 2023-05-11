import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Authentication/authService.dart';
import 'Authentication/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService authService = AuthService();
  String? username = "";
  String? department = "";
  String? session = "";
  String? email = "";
  String? mobile = "";

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {

    print(FirebaseAuth.instance.currentUser!.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          username = snapshot.data()!["fullName"];
          department = snapshot.data()!["dept"];
          session = snapshot.data()!["session"];
          email = snapshot.data()!["email"];
          mobile = snapshot.data()!["mobile"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                CircleAvatar(
                  radius: 100.0,
                  child: Image.asset("Image/bus1.png"),
                ),
                SizedBox(height: 10.0,),
                Text(
                  username!,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,color: Colors.black),
                ),
                SizedBox(height: 15.0,),
                Text(
                  "Department : "+department!,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Session : "+session!,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Mobile : "+mobile!,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Email : "+email!,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await authService.signOut();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false);
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
