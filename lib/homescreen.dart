import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:frontendproject/detailview.dart';
import 'package:frontendproject/location.dart';
import 'package:frontendproject/loginScreen.dart';
import 'package:frontendproject/networkfile.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String email;
  
  const HomeScreen({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> locations = [];

  @override
  void initState() {
    getLocations();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 30,),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          Text(
            widget.email,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey
            ),
          ),
          SizedBox(height: 10,),
          TextButton(
            onPressed: () async {
              await FacebookAuth.instance.logOut().then((value){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              });
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              backgroundColor: Colors.blue,
              textStyle: const TextStyle(fontSize: 20, color: Colors.white),
            ), 
            child: const Text('Logout'),
          ),
          SizedBox(height: 30,),
          Flexible(
            child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: locations.length,
      itemBuilder: (BuildContext context, int index) {
        Data location = locations[index];
        return Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedScreen(details: location,))),
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  NetworkImage("https://placekitten.com/640/360"),
              backgroundColor: Colors.transparent,
            ),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(location.title!),
            ),
            subtitle: Text(location.address!),
                ),
          ),
        );
      }
    ),
          )
        ],
      )
      
      
    );
  }

  getLocations () async {
    try {
      dynamic response = await NetworkFile().get('https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json');
      dynamic jsonData = jsonDecode(response) ;
      LocationResponse apiResponse = LocationResponse.fromJson(jsonData);
      setState(() {
        locations = apiResponse.data!;
      });
    } catch (e) {
      print("error is "+e.toString());
    }
  }
}
