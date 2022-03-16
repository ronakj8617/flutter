import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'Updated Files/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      home: Login_Form(),
      debugShowCheckedModeBanner: false,
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Login_Form extends StatefulWidget {
  const Login_Form({Key? key}) : super(key: key);

  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  @override
  final formKey = GlobalKey<FormState>();
  final _id = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Form'), backgroundColor: Colors.red),
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
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                label: Text("ID"),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
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
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                label: Text("Password"),
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {},                              
                              child: Text("Sign Up"),
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
