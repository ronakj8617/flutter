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
      home: Shared_Preferences(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Shared_Preferences extends StatefulWidget {
  const Shared_Preferences({Key? key}) : super(key: key);

  @override
  State<Shared_Preferences> createState() => _Shared_PreferencesState();
}

class _Shared_PreferencesState extends State<Shared_Preferences> {
  @override
  final formKey = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _password = TextEditingController();
  var ipv4 = null, ipv6 = null;
  // var preferences;
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
      appBar: AppBar(title: Text('Shared Preferences'), backgroundColor: Colors.red),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/img2.jpeg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.4),
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                  child: Form(
                      key: formKey,
                      child: Card(
                        color: Colors.white.withOpacity(0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _id,
                              decoration: InputDecoration(
                                hintText: "Enter ur ID",
                                border: OutlineInputBorder(),
                                label: Text("ID"),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: _password,
                              decoration: InputDecoration(
                                hintText: "Enter ur password",
                                border: OutlineInputBorder(),
                                label: Text("Password"),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final pref =
                                    await SharedPreferences.getInstance();

                                if (_id.text == 'Ronak' &&
                                    _password.text == '123') {

                                  pref.setBool("isLoggedIn", true);
                                  print(pref.getBool("isLoggedIn"));

                                  Alert(
                                    context: context,
                                    title: "Session created: ",
                                    desc: "Logged In Succesfully",
                                    image: Icon(Icons.login_sharp),
                                  ).show();
                                }

                                //CircularProgressIndicator();

                                // ipv4 = await Ipify.ipv4();
                                // //print(ipv4);

                                // ipv6 = await Ipify.ipv64();
                                //print(ipv6);
                                // if(_id.text=='Ronak' && _password=='123')

                                // if (_id.text == '') {
                                //   (ipv4 == null)
                                //       ? CircularProgressIndicator()
                                //       : Alert(
                                //           context: context,
                                //           title: "Enter ID and password: ",
                                //           desc:
                                //               "You can't sign in without entering ID and password",
                                //           image: Icon(
                                //               Icons.supervised_user_circle),
                                //         ).show();
                                // } else {
                                //   (ipv4 == null)
                                //       ? CircularProgressIndicator()
                                //       : Alert(
                                //           context: context,
                                //           title: "IPV4: " + ipv4.toString(),
                                //           desc: "IPV6: " + ipv6.toString(),
                                //           image: Icon(
                                //               Icons.supervised_user_circle),
                                //         ).show();
                                // }
                              },
                              style: ButtonStyle(),
                              child: Text("Sign In"),
                            )
                          ],
                        ),
                      ))),
            ),
          )
        ],
      ),
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
