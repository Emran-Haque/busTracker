
import 'package:flutter/material.dart';
import 'package:google_map_live/Authentication/login.dart';
import 'package:google_map_live/widgets.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  String hpassword = "";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(                                                      // SignUp  Password
              obscureText: true,
              decoration: textInputDecoration.copyWith(
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
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
                   hpassword = val;
                });
              },
            ),
            ElevatedButton(
                onPressed: (){

                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
