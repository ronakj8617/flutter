import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/drawer.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   appId: '1:71402755662:ios:3836f3c07c36ebc87d151f',
  //   projectId: 'flutter-apps-d93d4',
  //   messagingSenderId: '',
  //   androidClientId: '',
  //   appGroupId: '',
  //   authDomain: '',
  //   databaseURL: '',
  //   deepLinkURLScheme: '',
  //   measurementId: '',
  //   trackingId: '',
  //   apiKey: 'AIzaSyD_toge-ilTgrXUDaR5CEIN-CrbiE0gYes',
  //   iosClientId:
  //       '71402755662-ko63g8tlgn8m27t9kjhtklq58kev8r89.apps.googleusercontent.com',
  //   storageBucket: 'flutter-apps-d93d4.appspot.com',
  //   iosBundleId: 'com.example.myApp',
  // ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // final Future<FirebaseApp> _initialization=FirebaseApp.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Future Builder'), backgroundColor: Colors.red),
      body: CircularProgressIndicator(),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance.collection('testing').snapshots(),
      //     builder: (BuildContext buildContext,
      //         AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (!snapshot.hasData) print('success');
      // if (snapshot.hasError) print('error');
      // return ListView.builder(
      //     itemCount: snapshot.data?.docs.length,
      //     itemBuilder: (BuildContext buildContext, int index) {
      //       final docData = snapshot.data?.docs[index].data();
      //       final time = (docData as List<Timestamp>)[0].toDate();

      //       if (snapshot.hasData) {
      //         return ListTile(
      //           title: Text(time.toString()),
      //         );
      //       }

      //       return CircularProgressIndicator();
      //     });

      // return CircularProgressIndicator();

      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection('testing')
              .add({'Timestamp: ': Timestamp.fromDate(DateTime.now())});

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
