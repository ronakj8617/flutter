import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase
  runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Home extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Home({Key? key}) : super(key: key);
  // final Future<FirebaseApp> _initialization=FirebaseApp.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(160.0),
              child: Center(
                child: Column(
                    children: [CircularProgressIndicator(), Text('Done')]),
              ),
            );
          }

          return CircularProgressIndicator();
        });
  }
}
