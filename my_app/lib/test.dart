import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  // await Firebase
  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Home extends StatelessWidget {
   Home({ Key? key }) : super(key: key);
  // final Future<FirebaseApp> _initialization=FirebaseApp.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}