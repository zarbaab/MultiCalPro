import 'package:flutter/material.dart';
import 'bmi_calculator.dart'; // Import the BMI Calculator
import 'tip_calculator.dart'; // Import the Tip Calculator
import 'age_calculator.dart'; // Import the Age Calculator
import 'currency_converter.dart'; // Import the Currency Converter
import 'todo_list.dart'; // Import the To-Do List
import 'quadratic_solver.dart'; // Import the Quadratic Equation Solver
import 'temperature_converter.dart'; // Import the Temperature Converter
import 'speed_distance_time.dart'; // Import the Speed Distance Time Calculator
import 'discount_calculator.dart'; // Import the Discount Calculator
import 'fuel_efficiency.dart'; // Import the Fuel Efficiency Calculator

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BMICalculator()),
                  );
                },
                child: const Text('BMI Calculator'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TipCalculator()),
                  );
                },
                child: const Text('Tip Calculator'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AgeCalculator()),
                  );
                },
                child: const Text('Age Calculator'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CurrencyConverter()),
                  );
                },
                child: const Text('Currency Converter'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ToDoList()),
                  );
                },
                child: const Text('To-Do List'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuadraticSolver()),
                  );
                },
                child: const Text('Quadratic Equation Solver'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TemperatureConverter()),
                  );
                },
                child: const Text('Temperature Converter'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SpeedDistanceTimeCalculator()),
                  );
                },
                child: const Text('Speed Distance Time Calculator'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DiscountCalculator()),
                  );
                },
                child: const Text('Discount Calculator'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FuelEfficiencyCalculator()),
                  );
                },
                child: const Text('Fuel Efficiency Calculator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
