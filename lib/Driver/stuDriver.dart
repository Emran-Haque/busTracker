import 'package:flutter/material.dart';
import 'package:google_map_live/main.dart';

import '../widgets.dart';

class StuDriver extends StatefulWidget {
  const StuDriver({Key? key}) : super(key: key);

  @override
  State<StuDriver> createState() => _StuDriverState();
}

class _StuDriverState extends State<StuDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student's Bus"),
      ),
      body:  GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        children: [
          busContainer("Student Bus 1","stbus1",0),
          busContainer("Student Bus 2","stbus2",0),
          busContainer("Student Bus 3","stbus3",0),


        ],
      ),
    );
  }
}

