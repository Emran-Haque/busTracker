import 'package:flutter/material.dart';
import 'package:google_map_live/mymap.dart';

import 'main.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF42a5f5), width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF42a5f5), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF42a5f5), width: 2),
  ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}

Widget busContainer(String tname,String lname,int who){
  return Builder(
      builder: (context) {
        return InkWell(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Image.asset("Image/bus1.png"),
                ),
                Text(tname,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                )
              ],
            ),

            decoration: BoxDecoration(
                color: Colors.orange.shade100,
                border: Border.all(color: Colors.deepOrange,width: 2)
            ),
          ),
          onTap: (){
            if(who == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  BusRouteMap(tname: tname, lname: lname,)));
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  MyMap(lname)));
            }
            },
        );
      }
  );
}