import 'package:flutter/material.dart';
import 'package:unit_converter/conversion_logic/temp_conversion_logic.dart';

class Temp_page extends StatefulWidget {
  @override
  State<Temp_page> createState() => _Temp_pageState();
}

class _Temp_pageState extends State<Temp_page> {
  var drop_down_value_1 = 'Celcius';
  var drop_down_value_2 = 'Celcius';
  double result = 0;
  var get_temp = TextEditingController();
  var result_string = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Temperature Converter',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red.withOpacity(0.1),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
               image: AssetImage('assets/images/temp.jpeg'),
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
                Row(
                  children: [
                    Container(
                        width: 150,
                        color: Colors.white.withOpacity(0.7),
                        child: TextField(
                          decoration: const InputDecoration(
                              labelText: 'Give input here'
                          ),
                          controller: get_temp,
                          keyboardType: TextInputType.number,
                        )
                    ),

                    Container(
                      width: 100,
                      height: 59,
                      color: Colors.white.withOpacity(0.7),
                      child: DropdownButtonFormField(
                        value: drop_down_value_1,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300,
                        items: temp_available.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                        onChanged: (value){
                          setState(() {
                            drop_down_value_1 = value as String;
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.black,),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                        width: 150,
                        height: 48,
                        color: Colors.white.withOpacity(0.7),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(result.toStringAsFixed(2),style: const TextStyle(fontSize: 19)))
                    ),

                    Container(
                      width: 100,
                      color: Colors.white.withOpacity(0.7),
                      child: DropdownButtonFormField(
                        value: drop_down_value_2,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        menuMaxHeight: 300,
                        items: temp_available.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
                        onChanged: (value){
                          setState(() {
                            drop_down_value_2 = value as String;
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.black,),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        var result1 = get_temp.text.toString();
                        if(result1 == ""){
                          result_string = 'Please Enter INPUT';
                          result = 0;
                        }
                        else
                        {
                          result_string = "";
                          result = double.parse(result1);
                          result = Convert_Temperature(drop_down_value_1,result,drop_down_value_2);
                        }
                      });
                    },
                    child: const Text('CONVERT')),

                const SizedBox(height: 15),

                Text(result_string,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.yellow.shade200),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}