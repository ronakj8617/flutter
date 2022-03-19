import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/drawer.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<bool> init() async {
    FirebaseApp instance = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return instance != null;
  }

  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();

    init();


    // ? init();
    main();
    insert();
  }

  void insert() async{

    final String ip=await Ipify.ipv4();
    final String ipv6=await Ipify.ipv64();

    FirebaseFirestore.instance.collection('IP').add({
      'Timestamp': Timestamp.fromDate(DateTime.now()),
      'IPv4': ip ,
      'IPv6': ipv6
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Test'), backgroundColor: Colors.red),
      // body: CircularProgressIndicator(),
      body: Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (brightness == Brightness.dark) {
            brightness = Brightness.light;
            //main();

          } else {
            brightness = Brightness.dark;
            //main();
          }

          main();
        },
        backgroundColor: Colors.red,
        enableFeedback: true,
        child: Icon(Icons.add_a_photo, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: My_Drawer(),
    );
    ;
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
