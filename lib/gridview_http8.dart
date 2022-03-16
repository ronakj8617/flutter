import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/my_styles.dart';
import 'Updated Files/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gridview_Http(),
      theme: (brightness == Brightness.dark ? darkThemeData : lightThemeData)));
}

class Gridview_Http extends StatefulWidget {
  const Gridview_Http({Key? key}) : super(key: key);

  @override
  State<Gridview_Http> createState() => _Gridview_HttpState();
}

class _Gridview_HttpState extends State<Gridview_Http> {
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
      appBar: AppBar(title: Text('Gridview'), backgroundColor: Colors.red),
      //backgroundColor: Colors.black,
      body: Center(
          child: data != null
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("ID: ${data[index]['id']}"),
                      leading: Image.network(data[index]['url']),
                    );
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
