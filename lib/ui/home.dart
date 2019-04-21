import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BmiState();
  }

}

class BmiState extends State<Home>{

  final TextEditingController ageController = new TextEditingController();

  final TextEditingController heightController = new TextEditingController();

  final TextEditingController weightController = new TextEditingController();

  double bmi = 0.0;

  String health = "";

  void _bmi(){
    setState(() {

      bmi = calculate( ageController.text, heightController.text, weightController.text);
      if(double.parse(bmi.toStringAsFixed(1)) < 18.5){
        health = "Underweight";
      }else if (double.parse(bmi.toStringAsFixed(1)) >= 18.5 && bmi < 25){
        health = "Great Shape!";
      }else if(double.parse(bmi.toStringAsFixed(1)) >= 25.0 && bmi < 30){
        health = "Overweight";
      }else if(double.parse(bmi.toStringAsFixed(1)) >= 30.0){
        health = "Obese";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: Container(
        alignment: Alignment.topCenter,
        
        child: ListView(

          padding: EdgeInsets.all(2.5),
          children: <Widget>[

            Image.asset("images/bmilogo.png", width: 200.0,height: 133.0,),

            Container(
              margin: EdgeInsets.all(3.0),
              padding: EdgeInsets.all(1.0),
              alignment: Alignment.center,
              color: Colors.black12,
              child: Column(

                children: <Widget>[

                  TextField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    decoration: InputDecoration(
                      hintText: "e.g. 22",
                      labelText: "Age",
                      icon: Icon(Icons.person_outline)
                    ),
                  ),


                  TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    decoration: InputDecoration(
                        hintText: "e.g. 6.7",
                        labelText: "Height in Feet",
                        icon: Icon(Icons.insert_chart)
                    ),
                  ),


                  TextField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    decoration: InputDecoration(
                        hintText: "e.g. 60",
                        labelText: "Weight in lb",
                        icon: Icon(Icons.line_weight)
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(5.0),),
                  RaisedButton(

                    onPressed: () => _bmi(),
                    color: Colors.pink,
                    child: Text("Calculate", style: TextStyle(color: Colors.white),),
                  )






                ],
              ),
            ),


            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.topCenter,
              child: Column(

                children: <Widget>[
                  Text(
                    "Your BMI : ${bmi.toStringAsFixed(1)}", style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, fontSize: 18.0),

                  ),
                  Padding(padding: EdgeInsets.all(3.0),),

                  Text(
                    "$health", style: TextStyle(color: Colors.pink, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, fontSize: 18.0),
                  )
                ],
              ),
            )


          ],
        ),
      ),

    );
  }

  double calculate(String age, String height, String weight) {


    int age1 = int.parse(age);
    double inches = 12*double.parse(height);
    double weight1 = double.parse(weight);

    if((age.isNotEmpty || age1>0) && (height.isNotEmpty || inches>0) && (weight.isNotEmpty || weight1>0) ){
      double result = weight1 / (inches * inches) * 703;
      return result;
    }else{
      return 0.0;
    }


  }

}