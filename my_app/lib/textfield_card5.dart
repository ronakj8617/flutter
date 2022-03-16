import 'package:flutter/material.dart';
import 'package:my_app/Updated%20Files/drawer.dart';


void main() {
  runApp(MaterialApp(
    home: TextField_Card(),
    debugShowCheckedModeBanner: false,
  ));
}

class TextField_Card extends StatefulWidget {
  const TextField_Card({Key? key}) : super(key: key);
    //static const String routeName='/my_textField';


  @override
  State<TextField_Card> createState() => _TextField_CardState();
}

class _TextField_CardState extends State<TextField_Card> {
  TextEditingController _textEditingController = TextEditingController();
  var txt = 'Title';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txt = _textEditingController.text;
          setState(() {});
        },
        child: Icon(
          Icons.update,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: My_Drawer(),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Card(
              child: Image.asset('assets/img3.jpeg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              txt,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
              decoration: InputDecoration(
                  hintText: 'Enter ur name',
                  label: Text('Name'),
                  border: OutlineInputBorder()),
            )
          ],
        )),
      ),
    );
  }
}
