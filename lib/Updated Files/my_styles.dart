import 'package:flutter/material.dart';

Brightness brightness = Brightness.dark;
double rad = 4.0;

ThemeData lightThemeData =
    ThemeData(accentColor: Colors.black, brightness: brightness);
ThemeData darkThemeData =
    ThemeData(accentColor: Colors.red, brightness: brightness);

TextStyle titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: brightness == Brightness.dark ? Colors.red : Colors.black);

TextStyle subtitleTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: brightness == Brightness.dark ? Colors.red : Colors.black);

TextStyle headerTextStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

TextStyle headerSubtitleTextStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

class My_Styles extends StatelessWidget {
  const My_Styles({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}