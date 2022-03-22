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

    // FirebaseFirestore.instance
    //     .collection('Web')
    //     .where('Test', isGreaterThanOrEqualTo: 2)
    //     .get()
    //     .then((value) => print(
    //             value.docs.asMap()[0]!.data()[ip])
    //         //print(value.docs.iterator.current.data().keys);
    //         );

    if (kIsWeb) {
      bool webResult = await retrievewebData();
      // bool osResult = await retrieveOsData();

      if (webResult) {
        final browser = Browser();
        Web web = Web(ip, kIsWeb.toString(), browser.browserAgent.toString(),
            browser.version);
        FirebaseFirestore.instance.collection('Web').add({ip: web.toOsMap()});
      }
    } else if (!kIsWeb) {
      bool osResult = await retrieveOsData();

      if (osResult) {
        Os os = Os(
            Platform.operatingSystem,
            Platform.environment.toString(),
            Platform.localHostname == null ? 'NA' : Platform.localHostname,
            Platform.operatingSystemVersion == null
                ? 'NA'
                : Platform.operatingSystemVersion,
            Platform.numberOfProcessors.toString() == null
                ? 'NA'
                : Platform.numberOfProcessors.toString(),
            Platform.localeName == null ? 'NA' : Platform.localeName);

        print(BrowserAgent.Chrome.name);

        FirebaseFirestore.instance
            .collection(Platform.operatingSystem)
            .add({ip: os.toOsMap()});
      }
    }
  }

  static Future<bool> retrieveOsData() async {
    final String ip = await Ipify.ipv4();
    bool result = true;
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(Platform.operatingSystem)
        .get();

    if (snapshot.docs.isEmpty) {
      print('No data');
    }

    for (var i = 0; i <= snapshot.docs.length; i++) {
      if (snapshot.docs.asMap()[i]?.data()[ip] != null) {
        result = false;

        break;
      } else {
        result = true;

        break;
      }
    }

    return result;
  }

  static Future<bool> retrievewebData() async {
    final String ip = await Ipify.ipv4();
    bool result = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('Web').get();

    if (snapshot.docs.isEmpty) {
      print('No data');

      return true;
    }

    for (var i = 0; i <= snapshot.docs.length; i++) {
      if (snapshot.docs.asMap()[i]?.data()[ip] != null) {
        result = false;

        break;
      } else {
        break;
      }
    }

    return result;
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

  Map<String, dynamic> toOsMap() {
    return {'IP': ip, 'Web': web, 'Agent': agent, 'Web Version': web_version};
  }
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

  void sfs(DocumentSnapshot<Map<String, dynamic>> documentSnapshot1) {
    print(documentSnapshot1.data());
  }
}
