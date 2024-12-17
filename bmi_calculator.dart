import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight (kg)',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Height (cm)',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  double age = double.parse(ageController.text);
                  double weight = double.parse(weightController.text);
                  double height = double.parse(heightController.text) / 100;
                  double bmi = weight / (height * height);

                  setState(() {
                    if (bmi < 18.5) {
                      result = 'Your BMI is $bmi: you are underweight';
                    } else if (bmi >= 18.5 && bmi < 25) {
                      result = 'Your BMI is $bmi:you are healthy';
                    } else {
                      result = 'Your BMI is $bmi:you are  overweight';
                    }
                  });
                },
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 16.0),
              Text(
                result,
                style: TextStyle(fontSize: 24.0),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go("/RegistrationForm");
                },
                child: Text("Go To RegistrationForm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
