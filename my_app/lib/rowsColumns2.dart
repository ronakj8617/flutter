import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
          backgroundColor: Color.fromARGB(255, 141, 223, 47),
          primaryColor: Colors.black)));
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
          color: Colors.black,         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisSize: MainAxisSize.min,
          
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: Colors.red,
                
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  color: Colors.blue),
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  color: Colors.green)
            ],
          ),
        )));
  }
}
