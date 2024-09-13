import 'package:flutter/material.dart';
import 'dart:math';

class QuadraticSolver extends StatefulWidget {
  const QuadraticSolver({super.key});

  @override
  _QuadraticSolverState createState() => _QuadraticSolverState();
}

class _QuadraticSolverState extends State<QuadraticSolver> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _result = '';

  void _solveQuadratic() {
    double a = double.parse(_aController.text);
    double b = double.parse(_bController.text);
    double c = double.parse(_cController.text);

    double discriminant = b * b - 4 * a * c;
    if (discriminant >= 0) {
      double root1 = (-b + sqrt(discriminant)) / (2 * a);
      double root2 = (-b - sqrt(discriminant)) / (2 * a);
      setState(() {
        _result = 'Roots: $root1, $root2';
      });
    } else {
      setState(() {
        _result = 'No real roots';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quadratic Equation Solver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _aController,
              decoration: const InputDecoration(
                labelText: 'Enter coefficient a',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bController,
              decoration: const InputDecoration(
                labelText: 'Enter coefficient b',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _cController,
              decoration: const InputDecoration(
                labelText: 'Enter coefficient c',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _solveQuadratic,
              child: const Text('Solve'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
