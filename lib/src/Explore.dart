import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ExplorePage extends StatefulWidget{
  @override
  Explore createState() => Explore();
}

class Explore extends State<ExplorePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Static Grid Data"),
        backgroundColor: Color(0xffe46b10)),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.only(top: 30,bottom: 20,right: 20,left: 20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      icon: const Icon(Icons.info_outline),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Info');
                      },
                    ),
                  ),
                  Text('Info',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0))
                ],
              ),
              color: Colors.grey
          ),
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      icon: const Icon(Icons.message_outlined),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Query');
                      },
                    ),
                  ),
                  Text('Query',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0))
                ],
              ),
              color: Colors.grey
          ),
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      icon: const Icon(Icons.table_rows_sharp),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Tasks');
                      },
                    ),
                  ),
                  Text('Tasks',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0))
                ],
              ),
              color: Colors.grey
          ),
          Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: IconButton(
                      padding: new EdgeInsets.all(0.0),
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                  Text('LogOut',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0))
                ],
              ),
              color: Colors.grey
          ),
        ],
      ),


      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffe46b10),
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 100.0,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              leading: Icon(Icons.message_rounded),
              title: Text('Help & Support',
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('About',
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '');
              },
            ),
            ListTile(
              leading: Icon(Icons.notification_important_rounded),
              title: Text('Notification',
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, '');
              },
            ),
          ],
        ),
      ),
    );
  }
}