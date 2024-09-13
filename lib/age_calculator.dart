import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({super.key});

  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final TextEditingController _dobController = TextEditingController();
  String _age = '';

  void _calculateAge() {
    try {
      final dob = DateFormat('yyyy-MM-dd').parse(_dobController.text);
      final today = DateTime.now();
      final age = today.difference(dob);
      final years = (age.inDays / 365).floor();
      final months = ((age.inDays % 365) / 30).floor();
      final days = (age.inDays % 365) % 30;

      setState(() {
        _age = '$years years, $months months, $days days';
      });
    } catch (e) {
      // Handle parsing error
      setState(() {
        _age = 'Invalid date format';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dobController,
              decoration: const InputDecoration(
                labelText: 'Enter your date of birth (yyyy-mm-dd)',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAge,
              child: const Text('Calculate Age'),
            ),
            const SizedBox(height: 20),
            Text(
              _age,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
