import 'dart:ui';

import 'package:flutter/material.dart';

Brightness brightness = Brightness.dark;
double rad = 4.0;
ThemeData lightThemeData = ThemeData(
  accentColor: Colors.black,
  brightness:brightness
); 
ThemeData darkThemeData = ThemeData(
  accentColor: Colors.red,
  brightness: brightness
); 

TextStyle titleTextStyle= TextStyle(fontSize:25,fontWeight: FontWeight.bold,fontFamily: 'Times New Roman',color: brightness==Brightness.dark?Colors.red:Colors.black);
TextStyle subtitleTextStyle= TextStyle(fontSize:15,fontWeight: FontWeight.bold,fontFamily: 'Times New Roman',color: brightness==Brightness.dark?Colors.red:Colors.black);
TextStyle headerTextStyle= TextStyle(fontSize:30,fontWeight: FontWeight.bold,fontFamily: 'Times New Roman',color:Colors.black);

void main() {
  runApp(MaterialApp(
      home: Drawer3(),
      theme: (brightness==Brightness.dark?darkThemeData:lightThemeData)));
}

class Drawer3 extends StatelessWidget {
  const Drawer3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App bar'), backgroundColor: Colors.red),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (brightness == Brightness.dark) {
            brightness = Brightness.light;
            main();
          } else {
            brightness = Brightness.dark;
            main();
          }
        },
        backgroundColor: Colors.red,
        enableFeedback: true,
        child: Icon(Icons.add_a_photo,        
            color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(              
              child: Text('Ronak Parmar',
                  style: headerTextStyle,
                  textAlign: TextAlign.center),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.red,                
              ),
              margin: const EdgeInsets.all(0),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.person),
              title: Text('Ronak',style: titleTextStyle,),
              subtitle: Text('First Name',              
                style: subtitleTextStyle,
                
                
              ),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.person),
              title: Text('Parmar',style: titleTextStyle,),
              subtitle: Text('Last Name',
                style: subtitleTextStyle,
              ),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.email),
              title: Text('ronakj861750@icloud.com',style: titleTextStyle,),
              subtitle: Text('Email',
                style: subtitleTextStyle,
              ),
              trailing: Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
