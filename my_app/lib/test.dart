import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/drawer.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(() {
    print("completed");
  });
  // await Firebase
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
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // final Future<FirebaseApp> _initialization=FirebaseApp.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Future Builder'), backgroundColor: Colors.red),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('testing').snapshots(),
          builder: (BuildContext buildContext,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) print('success');
            if (snapshot.hasError) print('error');
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  final docData = snapshot.data?.docs[index].data();
                  final time = (docData as List<Timestamp>)[0].toDate();

                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(time.toString()),
                    );
                  }

                  return CircularProgressIndicator();
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
