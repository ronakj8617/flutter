 import 'dart:ui';

import 'package:flutter/material.dart';
import 'Updated Files/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Updated Files/my_styles.dart';

void main() {
  runApp(MaterialApp(
      home: Listview_Http(),
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Listview_Http extends StatefulWidget {
  const Listview_Http({Key? key}) : super(key: key);

  @override
  State<Listview_Http> createState() => _Listview_HttpState();
}

class _Listview_HttpState extends State<Listview_Http> {
  @override
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    // print(data);
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview'), backgroundColor: Colors.red),
      //backgroundColor: Colors.black,
      body: Center(
          child: data != null
              ? ListView.builder(
                  itemBuilder: ((context, index) {
                    return ListTile(title: Text(data[index]["title"]),subtitle: Text("ID: ${data[index]['id']}"),leading: Image.network(data[index]['url']),);
                  }),
                  itemCount: data.length,
                )
              : CircularProgressIndicator()),
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
