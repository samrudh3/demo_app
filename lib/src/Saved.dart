import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SavedPage extends StatefulWidget {
  @override
  Saved createState() => Saved();
}

class DataDemo1 {
  List<Transacts> transacts;

  DataDemo1({this.transacts});

  DataDemo1.fromJson(Map<String, dynamic> json) {
    if (json['transacts'] != null) {
      transacts = new List<Transacts>();
      json['transacts'].forEach((v) {
        transacts.add(new Transacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transacts != null) {
      data['transacts'] = this.transacts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transacts {
  String name;
  int id;
  String slug;
  String labelSeller;
  String labelBuyer;
  String icon;
  String priceUnit;

  Transacts(
      {this.name,
      this.id,
      this.slug,
      this.labelSeller,
      this.labelBuyer,
      this.icon,
      this.priceUnit});

  Transacts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
    labelSeller = json['label_seller'];
    labelBuyer = json['label_buyer'];
    icon = json['icon'];
    priceUnit = json['price_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['label_seller'] = this.labelSeller;
    data['label_buyer'] = this.labelBuyer;
    data['icon'] = this.icon;
    data['price_unit'] = this.priceUnit;
    return data;
  }
}

class Saved extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> getInfoData() async {
      String url = 'https://milkiyat.bangalore2.com/api/home/';
      var response = await http.get(
        Uri.parse(url),
        //     headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        // }
      );
      return json.decode(response.body)['transacts'];
    }

    return Scaffold(
      appBar:
          AppBar(title: Text("Response From Transacts"), backgroundColor: Color(0xffe46b10)),
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
                    var labelSeller = snapshot.data[index]['label_seller'];
                    var labelBuyer = snapshot.data[index]['label_buyer'];
                    var priceUnit = snapshot.data[index]['price_unit'];
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
                        title: Text(labelSeller),
                        subtitle: Text(labelBuyer),
                      ),
                    );
                  },
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      )),
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
