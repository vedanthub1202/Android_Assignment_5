import 'dart:math';

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int currentindex=0;
  String result = '';
  double height = 0;
  double weight = 0;
  String resultdetail = "";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String getInterpretation(int bmi)
  {
    if(bmi>=25) {
      return 'OVERWEIGHT';
    } else if(bmi>18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("female", Colors.pink, 1),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("your Height in Cm: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your height in Cm",
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                Text("your Weight in kg: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your weight in kg",
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  child: FlatButton(
                    minWidth: double.infinity,
                    height: 60.0,
                    onPressed: (){
                      setState(() {
                        height= double.parse(heightController.value.text);
                        weight= double.parse(weightController.value.text);
                      });
                      calculateBMI(height, weight);
                    },
                    color: Colors.blue,
                    child: Text("Calculate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("Your BMI is: ",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50.0,),
                Container(
                  width: double.infinity,
                  child: Text("$result",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    resultdetail,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  void calculateBMI(double height, double weight)
  {
    double bmi = weight / pow(height/100,2);
    double num1 = double.parse((bmi).toStringAsFixed(2));
    setState(() {
      result = num1.toString();
      resultdetail = getInterpretation(bmi.toInt());
    });
  }

  void changeIndex(int index){
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          height: 80.0,
          child: FlatButton(
            color: currentindex==index? color:Colors.grey,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),

            onPressed: () {
              changeIndex(index);
            },

            child: Text(value,
            style: TextStyle(
              color: currentindex==index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
    );
  }
}
