import 'package:flutter/material.dart';
import 'package:google_map_live/Driver/stuDriver.dart';
import 'package:google_map_live/Rider/teachersBus.dart';

class DriverInterface extends StatefulWidget {
  const DriverInterface({Key? key}) : super(key: key);

  @override
  State<DriverInterface> createState() => _DriverInterfaceState();
}

class _DriverInterfaceState extends State<DriverInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transports",
          style: TextStyle(
            fontSize: 25.0
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 11,
          mainAxisSpacing: 11,
          children: [
            InkWell(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("Image/bus.png"),
                    ),
                    Text("Teacher's Bus",
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                    )
                  ],
                ),

                decoration: BoxDecoration(
                color: Colors.orange.shade100,
                border: Border.all(color: Colors.deepOrange,width: 2),
              )
              ),
               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherBus()));},
            ),

            InkWell(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("Image/bus1.png"),
                    ),
                    Text("Student Bus",
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
               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StuDriver()));},
            ),
            InkWell(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("Image/bus1.png"),
                    ),
                    Text("Staff Bus",
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
              // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffBusActivity()));},
            ),





            InkWell(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("Image/bus1.png"),
                    ),
                    Text("Staff Bus",
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
              // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffBusActivity()));},
            ),






          ],
        ),
      ),
    );
  }
}
