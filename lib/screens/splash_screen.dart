import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/screens/home_screen.dart';

class Splash_Screen extends StatefulWidget
{
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade50,
                Colors.blue.shade900
              ]
          )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/images/unit_converter.jpeg',height: 100,width: 100),
                SizedBox(height: 50,),
                Text("UNIT\nCONVERTER",textAlign: TextAlign.center,)
              ],
            ),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}