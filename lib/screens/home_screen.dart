import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:unit_converter/screens/currency_screen.dart';
import 'package:unit_converter/screens/length_screen.dart';
import 'package:unit_converter/screens/weight_screen.dart';
import 'package:unit_converter/screens/temp_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int current_index = 0;

  var pages = [
    Currency_page(),
    Length_page(),
    Temp_page(),
    Mass_page()
  ];

  void onTap(int index)
  {
      setState(() {
        current_index = index;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[current_index],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,      //by default it is shifting instead of fixed
        backgroundColor: Colors.black,
        onTap: onTap,
        currentIndex: current_index,
        selectedItemColor: Colors.blueAccent.shade200,
        unselectedItemColor: Colors.grey.shade500,
        showUnselectedLabels: false,
        elevation: 0,

        items: const [
          BottomNavigationBarItem(
            label: 'Currency',
            icon: Icon(Icons.currency_rupee),
            tooltip: 'Currency Converter',
          ),

          BottomNavigationBarItem(
              label: 'Length',
              icon: Icon(Icons.social_distance),
              tooltip: 'Length Converter',
          ),

          BottomNavigationBarItem(
              label: 'Temp',
              icon: Icon(Icons.thermostat),
              tooltip: 'Temperature Converter'
          ),

          BottomNavigationBarItem(
              label: 'Mass',
              icon: Icon(Icons.monitor_weight_outlined),
              tooltip: 'Weight Converter'
          )

        ],
      ),

      /*
      //Google navigation bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: GNav(
            tabBackgroundColor: Colors.grey.shade700,
            backgroundColor: Colors.black,
//            color: Colors.blue, //we can use instead of this in tabs iconColor: Colors.blue
            activeColor: Colors.white,
            onTabChange: (index){
              print(index);
            },
            padding: EdgeInsets.all(12),
            gap: 10,

            tabs: [
              GButton(icon: Icons.currency_rupee,text: 'Currency',iconColor: Colors.blue,),
              GButton(icon: Icons.social_distance,text: 'Length',iconColor: Colors.blue),
              GButton(icon: Icons.thermostat,text: 'Temp',iconColor: Colors.blue),
              GButton(icon: Icons.monitor_weight_outlined,text: 'Mass',iconColor: Colors.blue)
            ],
          ),
        ),
      )
      */

    );
  }
}