import 'package:flutter/material.dart';
import 'package:google_map_live/main.dart';

import '../widgets.dart';

class StudentBus extends StatefulWidget {
  const StudentBus({Key? key}) : super(key: key);

  @override
  State<StudentBus> createState() => _StudentBusState();
}

class _StudentBusState extends State<StudentBus> {
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
          busContainer("Student Bus 1","stbus1",1),
          busContainer("Student Bus 2","stbus2",1),
          busContainer("Student Bus 3","stbus3",1),


        ],
      ),
    );
  }
}

