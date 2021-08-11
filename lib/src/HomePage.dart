import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  Home createState() => Home();
}

class DataDemo {
  List<Categories> categories;

  DataDemo({this.categories});

  DataDemo.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String name;
  String slug;
  String icon;

  Categories({this.name, this.slug, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    return data;
  }
}

class Home extends State<HomePage> {
  Future<List<dynamic>> getInfoData() async {
    String url = 'https://milkiyat.bangalore2.com/api/home/';
    var response = await http.get(Uri.parse(url),
    //     headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // }
    );
    return json.decode(response.body)['categories'];
  }
  final String title = "Response From Categories";
  @override
  Widget build(BuildContext context) {
    const primaryclr = const Color(0xffe46b10);
    getInfoData();
    return Scaffold(
      appBar: AppBar(title: Text(title),
        backgroundColor: primaryclr,),

      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<List<dynamic>>(
            future: getInfoData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var name = snapshot.data[index]['name'];
                      var slug = snapshot.data[index]['slug'];
                      var icon = snapshot.data[index]['icon'];
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          leading: Image.network(icon),
                          title: Text(name),
                          subtitle: Text(slug),
                        ),
                      );
                    },
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        )

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
