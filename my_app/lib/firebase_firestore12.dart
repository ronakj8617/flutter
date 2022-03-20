import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/drawer.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
      home: Firestore_Example(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Firestore_Example extends StatefulWidget {
  Firestore_Example({Key? key}) : super(key: key);

  @override
  State<Firestore_Example> createState() => _Firestore_ExampleState();
}

class _Firestore_ExampleState extends State<Firestore_Example> {
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

    // ? init();
    main();
  }

  // final Future<FirebaseApp> _initialization=FirebaseApp.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Firestore'), backgroundColor: Colors.red),
      // body: CircularProgressIndicator(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('testing').snapshots(),
          builder: (BuildContext buildContext,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) print('success');
            if (snapshot.hasError) {
              return Text('Error');
            }

            if (snapshot.connectionState == ConnectionState.active) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  DateTime txt = ((data['Timestamp'] as Timestamp).toDate());
                  print(txt.toString());
                  return ListTile(
                    title: Text(txt.toString()),
                    // subtitle: Text(data['company']),
                  );
                }).toList(),
              );
            }
            // return ListView.builder(
            //     itemCount: snapshot.data?.docs.length,
            //     itemBuilder: (BuildContext buildContext, int index) {
            //       final docData = snapshot.data?.docs[index].data();
            //       final time = (docData!['Timestamp'] as Timestamp).toDate();

            //       if (snapshot.hasData) {
            //         return ListTile(
            //           title: Text(time.toString()),
            //         );
            //       }

            //       return CircularProgressIndicator();
            //     });

            return CircularProgressIndicator();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firebase.initializeApp();
          FirebaseFirestore.instance
              .collection('testing')
              .add({'Timestamp': Timestamp.fromDate(DateTime.now())});

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
