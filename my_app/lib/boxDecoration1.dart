import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
          backgroundColor: Color.fromARGB(255, 141, 223, 47), primaryColor: Colors.black)));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'App bar is here',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red),
      )),
      body: Center(
          child: Container(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 114, 240, 119),
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple, Colors.red]),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: Colors.white,
                  blurStyle: BlurStyle.outer)
            ],
            shape: BoxShape.rectangle),
        width: 200,
        height: 200,
        child: Text(
          'Hello Everyone',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              textBaseline: TextBaseline.alphabetic),
        ),
      )),
    );
  }
}
