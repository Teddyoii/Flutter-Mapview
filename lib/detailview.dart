import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frontendproject/location.dart';
import 'package:frontendproject/mapview.dart';

class DetailedScreen extends StatelessWidget {

  final Data details;
  
  const DetailedScreen({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MapView(lattitude: double.parse(details.latitude!) , longitutde:double.parse(details.longitude!),)));
          },
        )
      ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 40,),
            Image.network(
              "https://placekitten.com/640/360",
              width: 300,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                details.title!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                details.description!,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}