import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final countryController = TextEditingController();
  final capitalController = TextEditingController();
  String country, capital;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries and Their Capitals"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Country Name'),
            controller: countryController,
            onChanged: (val) {
              setState(() {
                country = val;
              });
            }),
          TextField(
            decoration: InputDecoration(labelText: 'Capital Name'),
            controller: capitalController,
            onChanged: (val) {
              setState(() {
                  capital = val;
              });


            }

          ),
          FlatButton(
            child: Text('Add to Firebase'),
            textColor: Colors.purple,
            onPressed: () {
              Firestore.instance.collection('countries').document()
                  .setData({ 'country': country, 'capital': capital });


            }
             ),

        ],

      )
    );
  }
}
