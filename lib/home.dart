import 'package:flutter/material.dart';
import 'package:google_map_live/password.dart';
import 'package:google_map_live/widgets.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var high = MediaQuery.of(context).size.height*.30;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bus Tracker"),
        ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Container(
                      height: high,
                      color: Colors.green,
                      // decoration: BoxDecoration(
                      // ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height-high,
                      child: GridView.count(crossAxisCount: 2,
                      children: [
                        InkWell(
                          child: Container(
                                color: Colors.red,
                          ),
                          onTap: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) =>
                                Password()));
                          },
                        )
                      ],
                      ),
                    )
                  ],
                ),
              ),
            )
      ),
    );
  }
}

