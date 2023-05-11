import 'package:flutter/material.dart';
import 'package:google_map_live/Rider/studentBus.dart';

import '../widgets.dart';

class TeacherBus extends StatefulWidget {
  const TeacherBus({Key? key}) : super(key: key);

  @override
  State<TeacherBus> createState() => _TeacherBusState();
}

class _TeacherBusState extends State<TeacherBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher's Bus"),
      ),
      body:  GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        children: [
          busContainer("19216801", "stbus2",1),
          busContainer("19216802", "stbus2",1),
          busContainer("19216803", "stbus2",1),

        ],
      ),
    );
  }
}
