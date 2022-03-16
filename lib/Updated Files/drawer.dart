import 'package:flutter/material.dart';
import 'package:my_app/gridview_http8.dart';
import 'package:my_app/listview_http7.dart';
import 'package:my_app/login_form9.dart';
import 'package:my_app/main.dart';
import 'package:my_app/textfield_card5.dart';

import '../test.dart';
import 'my_styles.dart';

class My_Drawer extends StatelessWidget {
  const My_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              accountName: Text(
                'Ronak Parmar',
                style: headerTextStyle,
              ),
              accountEmail: Text(
                'ronakj86170@icloud.com',
                style: headerSubtitleTextStyle,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/photos/computer-hacker-with-mobile-phone-picture-id653027122?s=612x612'),
              )
              //Image.network('https://media.istockphoto.com/photos/computer-hacker-with-mobile-phone-picture-id653027122?s=612x612',fit: BoxFit.fill),
              ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              'Test',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Test',
              style: subtitleTextStyle,
            ),
            trailing: Icon(Icons.start),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              'Home',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Test',
              style: subtitleTextStyle,
            ),
            trailing: Icon(Icons.start),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TextField_Card()),
              );
            },
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              'TextField',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Test',
              style: subtitleTextStyle,
            ),
            trailing: Icon(Icons.start),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Listview_Http()),
              );
            },
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              'Listview',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Test',
              style: subtitleTextStyle,
            ),
            trailing: Icon(Icons.start),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Gridview_Http()),
              );
            },
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              'Gridview',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Test',
              style: subtitleTextStyle,
            ),
            trailing: Icon(Icons.start),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login_Form()),
              );
            },
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              'Login Form',
              style: titleTextStyle,
            ),
            subtitle: Text(
              'Test',
              style: subtitleTextStyle,
            ),
            trailing: Icon(Icons.start),
          ),
        ],
      ),
    );
  }
}
