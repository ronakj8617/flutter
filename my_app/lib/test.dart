import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/drawer.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:web_browser_detect/web_browser_detect.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // print('-------------------------------------------------------');
  // print('\n\n');
  // if (kIsWeb) {
  //   print("Web:" + kIsWeb.toString());
  //   final browser = Browser();
  //   print("Agent:" + browser.browserAgent.name);

  //   print('${browser.browser} ${browser.version}');
  // } else {

  // print('-------------------------------------------------------');
  // print('\n\n');
  //   print("OS: " + Platform.operatingSystem);
  //   print("Environment:" + Platform.environment.toString());
  //   print("Executable: " + Platform.executable);
  //   print("Local name: " + Platform.localeName);
  //   print("OS Version:" + Platform.operatingSystemVersion);
  //   print("Number of processors: " + Platform.numberOfProcessors.toString());
  //   print("Localhostname: " + Platform.localHostname);
  //   print("Script:" + Platform.script.toString());
  // }

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
  void initState() {
    // TODO: implement initState
    super.initState();

    init();

    // ? init();
    main();
    insert();
  }

  void insert() async {
    final String ip = await Ipify.ipv4();
    final String ipv6 = await Ipify.ipv64();
    if (Platform.numberOfProcessors != null) {
      // if (kIsWeb) {
      //   Data data = Data(
      //       ip,
      //       kIsWeb.toString(),
      //       browser.browserAgent.toString(),
      //       browser.version,
      //       Platform.operatingSystem,
      //       Platform.environment.toString(),
      //       Platform.executable,
      //       Platform.localHostname,
      //       Platform.operatingSystemVersion,
      //       Platform.numberOfProcessors.toString(),
      //       Platform.localeName);
      // } else {
      //   Data data = Data(
      //       ip,
      //       kIsWeb.toString(),
      //       browser.browserAgent.toString(),
      //       browser.version,
      //       Platform.operatingSystem,
      //       Platform.environment.toString(),
      //       Platform.executable,
      //       Platform.localHostname,
      //       Platform.operatingSystemVersion,
      //       Platform.numberOfProcessors.toString(),
      //       Platform.localeName);
      // }

      // if(Platform.nu)
      Os os = Os(
          Platform.operatingSystem,
          Platform.environment.toString(),
          // Platform.executable == null ? 'NA' : Platform.executable,
          Platform.localHostname == null ? 'NA' : Platform.localHostname,
          Platform.operatingSystemVersion == null
              ? 'NA'
              : Platform.operatingSystemVersion,
          Platform.numberOfProcessors.toString() == null
              ? 'NA'
              : Platform.numberOfProcessors.toString(),
          Platform.localeName == null ? 'NA' : Platform.localeName);

// DocumentReference storeReference = FirebaseFirestore.instance
//           .collection(Platform.operatingSystem)
//           .add({ip: os}).then((value) => print('sdfsd'););
//   await storeReference.setData(await votedown());

      CollectionReference<Map<String, dynamic>> stream =
          FirebaseFirestore.instance.collection('macos');

      // Future<QuerySnapshot<Map<String, dynamic>>> snapshot =stream.get();

      // Map<String,dynamic> map= snapshot..data()!.docs.map((DocumentSnapshot document);

      retrieveData();

      //print(retrieveEmployees());
      FirebaseFirestore.instance
          .collection(Platform.operatingSystem)
          .add({ip: os.toOsMap()});
    } else {
      final browser = Browser();

      Web web = Web(ip, kIsWeb.toString(), browser.browserAgent.toString(),
          browser.version);
      FirebaseFirestore.instance.collection('Web').add({ip: web});
    }
  }

  Future<List<Os>> retrieveData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(Platform.operatingSystem)
        .get();

    print(snapshot.docs.asMap()[1]?.data()['182.77.122.204']['OS']);

    // print(snapshot.docs
    //     .map((docSnapshot) =>
    //         Os.fromDocumentSnapshot(docSnapshot) as Map<String, dynamic>)
    //     .toList());

    return snapshot.docs
        .map((docSnapshot) => Os.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test'), backgroundColor: Colors.red),
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

class Data {
  final String ip;
  late final String web;
  final String agent;
  final String web_version;
  final String os;
  final String environment;
  final String executable;
  final String localName;
  final String operatingSystemVersion;
  final String numberOfProcessors;
  final String localHostName;

  // Data(this.ip, this.web, this.agent, this.web_version);
  Data(
      this.ip,
      this.web,
      this.agent,
      this.web_version,
      this.os,
      this.environment,
      this.executable,
      this.localHostName,
      this.operatingSystemVersion,
      this.numberOfProcessors,
      this.localName);
}

class Web {
  final String ip;
  late final String web;
  final String agent;
  final String web_version;

  Web(this.ip, this.web, this.agent, this.web_version);
}

class Os {
  final String os;
  final String environment;
  // final String executable;
  final String localName;
  final String operatingSystemVersion;
  final String numberOfProcessors;
  final String localHostName;

  Os(this.os, this.environment, this.localName, this.operatingSystemVersion,
      this.numberOfProcessors, this.localHostName);

  Map<String, dynamic> toOsMap() {
    return {
      'OS': os,
      'Environment': environment,
      'Local Name': localName,
      'Operating System Version': operatingSystemVersion,
      'Number of Processors': numberOfProcessors,
      'Local Hostname': localHostName
    };
  }

  Os.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot1)
      : os = documentSnapshot1.data()?['data'],
        environment = documentSnapshot1.data()!['Environment'],
        localName = documentSnapshot1.data()!['Local Name'],
        operatingSystemVersion =
            documentSnapshot1.data()!['Operating System Version'],
        numberOfProcessors = documentSnapshot1.data()!['Number of Processors'],
        localHostName = documentSnapshot1.data()!['Local Hostname'];

  // factory Os.fromSnapshot(DocumentSnapshot snap) {
  //   Map<String, dynamic> data = snap.data()! as Map<String, dynamic>;
  //   return Os(
  //       os: data['OS'],
  //       environment = data['Environment'],
  //       localName = data['Local Name'],
  //       operatingSystemVersion = data['Operating System Version'],
  //       numberOfProcessors = data['Number of Processors'],
  //       localHostName = data['Local Hostname']);
  // }

  void sfs(DocumentSnapshot<Map<String, dynamic>> documentSnapshot1) {
    print(documentSnapshot1.data());
  }
}
