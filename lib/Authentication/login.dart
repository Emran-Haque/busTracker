import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_live/Authentication/studentRegistation.dart';
import 'package:google_map_live/home.dart';

import '../widgets.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome to",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),

                Text("SHU Transport",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),

                SizedBox(height: 70.0,),

                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },

                  // check tha validation
                  validator: (val) {
                    return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                ),
                SizedBox(height: 15,),

                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme
                            .of(context)
                            .primaryColor,
                      )),
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(onPressed: () {}, child: Text(
                      "forget password?"
                  )),
                ),
                SizedBox(height: 10,),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        signIn(email, password);
                      },
                      child: Text("Sign in",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New user?"),
                    TextButton(onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>
                          StudentRegi()));
                    },
                        child: Text(
                            "Sign Up"
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn(String email, String password) async {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final User? user = (await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password)).user;
      if (user != null) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => Home()));
      }
      else {
        showSnackbar(
            context, Colors.red, "Your email and password doesn't match!");
      }
  }
}