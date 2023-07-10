import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontendproject/homescreen.dart';

import 'package:frontendproject/networkfile.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  }



class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () async {
            try {
              final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile
            // or FacebookAuth.i.login()
            if (result.status == LoginStatus.success) {
                dynamic userData = await FacebookAuth.instance.getUserData();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(name: userData['name'], email: userData['email'],)));
            } else {
               print("Errorrr");
                print(result.status);
                print(result.message);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(name: "Error", email: "Error",)));
            }
            } catch (e) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(name: "Error", email: "Error",)));
            }
            

            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: const Text('Sign In with Facebook'),
        ),
      ),
    )
   );
  }

}