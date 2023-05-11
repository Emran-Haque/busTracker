import 'package:flutter/material.dart';
import 'package:google_map_live/profile.dart';
import 'package:google_map_live/widgets.dart';

import 'Rider/studentBus.dart';
import 'Rider/teachersBus.dart';

class HomeActivity extends StatelessWidget{
  const HomeActivity({Key? key}) : super(key: key);

  MySnackBar(massage,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(massage))
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Tracker"),
        titleSpacing: 0,
        //centerTitle: true,
        toolbarHeight: 50,
        toolbarOpacity: 0.8,
        elevation: 0,
      //  backgroundColor: Colors.deepOrange,
        actions: [
          //IconButton(onPressed: (){MySnackBar("This is Home.",context);}, icon: Icon(Icons.home)),
          //IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackBar("This is Notification.",context);}, icon: Icon(Icons.notifications)),
          //IconButton(onPressed: (){MySnackBar("This is Search.",context);}, icon: Icon(Icons.search)),
          //IconButton(onPressed: (){MySnackBar("This is Setting.",context);}, icon: Icon(Icons.settings)),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(                                                 //   bottom Navigation bar
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on),label: "Bus Location"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: (int index)
        {
          if(index==0)
          {
            MySnackBar("This Home.", context);

          }
          if(index==1){
            MySnackBar("Find the bus.", context);
          }
          if(index==2){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
          }
        },
      ),

      drawer: Drawer(                                                   //  Navigation bar
        child: ListView(

          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepOrange),
                  accountName: Text("Bus Tracker",style: TextStyle(color: Colors.black,fontSize:25),),
                  accountEmail: Text(""),
                  currentAccountPicture: Image.asset("Image/bus1.png"),
                )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeActivity()));
              },
            ),

            ListTile(
              leading: Icon(Icons.bus_alert_sharp),
              title: Text("Bus's List"),
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>BusListActivity()));},
            ),

            ListTile(
              leading: Icon(Icons.call),
              title: Text("Drivers Number"),
              onTap: (){
                MySnackBar("Sumon- 01700000000", context);
                //MySnackBar("Saddam- 01700000000", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help)
              ,title: Text("Help"),
              onTap: (){
                MySnackBar("This service is unable right now", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){
                MySnackBar("This is settings.", context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About us"),
              onTap: (){
                MySnackBar("Hi I am Sayed Mohaiminul Haque. I am from Sheikh Hasina University. If you find any problem, Please call in this number. 01767415557", context);
              },
            )
          ],
        ),
      ),




      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        children: [
          InkWell(
            child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("Image/bus1.png"),
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
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentBus()));},
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
             //onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>StaffBusActivity()));},
          )
        ],
      ),
    );
  }
}