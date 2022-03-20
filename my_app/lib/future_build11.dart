import 'dart:ui';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Updated Files/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      home: Future_Build(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Future_Build extends StatefulWidget {
  const Future_Build({Key? key}) : super(key: key);

  @override
  State<Future_Build> createState() => _Future_BuildState();
}

class _Future_BuildState extends State<Future_Build> {
  @override
  final formKey = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _password = TextEditingController();
  var ipv4 = null, ipv6 = null;
  // var preferences;
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

  Future fetchData() async {
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    // print(data);
    // setState(() {});

    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  final preferences = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Future Builder'), backgroundColor: Colors.red),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (brightness == Brightness.dark) {
            brightness = Brightness.light;
            //main();

          } else {
            brightness = Brightness.dark;
            //main();
          }

          setState(() {});
          main();
        },
        backgroundColor: Colors.red,
        enableFeedback: true,
        child: Icon(Icons.add_a_photo, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: My_Drawer(),
    );
  }
}

class Prefs {
  static final preferences = SharedPreferences.getInstance();
}
