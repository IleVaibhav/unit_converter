import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/conversion_logic/weight_conversion_logic.dart';

class Mass_page extends StatefulWidget {
  @override
  State<Mass_page> createState() => _Mass_pageState();
}

class _Mass_pageState extends State<Mass_page> {
  var drop_down_value_1 = 'gram';
  var drop_down_value_2 = 'gram';
  double result = 0;
  var get_weight = TextEditingController();
  var result_string = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Weight Converter'),
        backgroundColor: Colors.white60.withOpacity(0.1),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/weight.jpeg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            width: 250,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                        width: 180,
                        color: Colors.white.withOpacity(0.7),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Enter $drop_down_value_1 here'),
                          controller: get_weight,
                          keyboardType: TextInputType.number,
                        )),
                    Container(
                      width: 70,
                      height: 59,
                      color: Colors.white.withOpacity(0.7),
                      child: DropdownButtonFormField(
                        value: drop_down_value_1,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300,
                        items: weight_available
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            drop_down_value_1 = value as String;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        width: 180,
                        height: 48,
                        color: Colors.white.withOpacity(0.7),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text('${result.toStringAsFixed(3)}',
                                style: TextStyle(fontSize: 19)))),
                    Container(
                      width: 70,
                      color: Colors.white.withOpacity(0.7),
                      child: DropdownButtonFormField(
                        value: drop_down_value_2,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300,
                        items: weight_available
                            .map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            drop_down_value_2 = value as String;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var result1 = get_weight.text.toString();
                        if (result1 == "") {
                          result_string = 'Please Enter INPUT';
                          result = 0;
                        } else {
                          result_string = "";
                          result = double.parse(result1);
                          result = Convert_Weight(drop_down_value_1, result, drop_down_value_2);
                        }
                      });
                    },
                    child: Text('CONVERT')),
                  SizedBox(height: 15),
                  Text(
                    result_string,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
