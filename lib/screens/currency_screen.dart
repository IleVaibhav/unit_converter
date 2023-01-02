import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/conversion_logic/currency_conversion_logic.dart';


class Currency_page extends StatefulWidget {
  @override
  State<Currency_page> createState() => _Currency_pageState();
}

class _Currency_pageState extends State<Currency_page> {
  var drop_down_value_1 = 'rupee';
  var drop_down_value_2 = 'rupee';
  double result = 0;
  var get_currency = TextEditingController();
  var result_string = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Currency Converter',style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.orange.shade300.withOpacity(0.2),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rupee.png'),
            fit: BoxFit.cover
          )
        ),

        child: Center(
          child: Container(
            width: 250,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  // DropdownButtonFormField(
                  //     value: drop_down_value,
                  //     isExpanded: true,
                  //     menuMaxHeight: 300,
                  //     items: currency_available.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                  //     onChanged: (value){
                  //       setState(() {
                  //         drop_down_value = value as String;
                  //       });
                  //     },
                  Row(
                    children: [
                      Container(
                          width: 180,
                          color: Colors.white.withOpacity(0.7),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter $drop_down_value_1 here'
                            ),
                            controller: get_currency,
                            keyboardType: TextInputType.number,
                          )
                      ),

                      Container(
                        width: 70,
                        height: 59,
                        color: Colors.white.withOpacity(0.7),
                        child: DropdownButtonFormField(
                          value: drop_down_value_1,
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          menuMaxHeight: 300,
                          items: currency_available.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                          onChanged: (value){
                            setState(() {
                              drop_down_value_1 = value as String;
                            });
                          },
                          icon: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.black,),
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                        width: 180,
                        height: 48,
                        color: Colors.white.withOpacity(0.7),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('${result.toStringAsFixed(2)}',style: TextStyle(fontSize: 19)))
                    ),

                    Container(
                      width: 70,
                      color: Colors.white.withOpacity(0.7),
                      child: DropdownButtonFormField(
                        value: drop_down_value_2,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300,
                        items: currency_available.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                        onChanged: (value){
                          setState(() {
                            drop_down_value_2 = value as String;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.black,),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        var result1 = get_currency.text.toString();
                        if(result1 == ""){
                          result_string = 'Please Enter INPUT';
                          result = 0;
                        }
                        else
                        {
                          result_string = "";
                          result = double.parse(result1);
                          result = Convert_Currency(drop_down_value_1,result,drop_down_value_2);
                        }
                      });
                    },
                    child: Text('CONVERT')),

                SizedBox(height: 15),

                Text(result_string,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.yellow.shade200),)

              ],
            ),
          ),
        ),
      )
    );
  }
}