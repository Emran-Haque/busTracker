import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_map_live/Authentication/login.dart';
import 'package:google_map_live/home.dart';
import 'package:google_map_live/mymap.dart';
import 'package:google_map_live/profile.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'Authentication/authService.dart';
import 'Authentication/studentRegistation.dart';
import 'Driver/driverInterface.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(MaterialApp(
      home: const Myapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          if(snapshot.hasData){
            return const HomeActivity();
          } else if (snapshot.hasError){
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child:  CircularProgressIndicator(
            ),
          );
        }
        return const LoginPage();
        }
    );
  }
}










class BusRouteMap extends StatefulWidget {
  final String? tname,lname;
  const BusRouteMap({Key? key,this.tname,this.lname}) : super(key: key);

  @override
  _BusRouteMapState createState() => _BusRouteMapState();
}

class _BusRouteMapState extends State<BusRouteMap> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.tname.toString()),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  _getLocation();
                },
                child: Text('add my location')),
            TextButton(
                onPressed: () {
                  _listenLocation();
                },
                child: Text('enable live location')),
            TextButton(
                onPressed: () {
                  _stopListening();
                },
                child: Text('stop live location')),
            Expanded(
                child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('busLocation').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(snapshot.data!.docs[index]['name'].toString()),
                        subtitle: Row(
                          children: [
                            Text(snapshot.data!.docs[index]['latitude']
                                .toString()),
                            SizedBox(
                              width: 20,
                            ),
                            Text(snapshot.data!.docs[index]['longitude']
                                .toString()),
                          ],
                        ),
                        // trailing: IconButton(
                        //   icon: Icon(Icons.directions),
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) =>
                        //             MyMap(snapshot.data!.docs[index].id)));
                        //     print(snapshot.data!.docs[index].id);
                        //   },
                        // ),
                      );
                    });
              },
            )),
          ],
        ),
      ),
    );
  }

  // Location added to the firebase


  _getLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('busLocation').doc(widget.lname).set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': widget.tname
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('busLocation').doc(widget.lname).set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': widget.tname
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
