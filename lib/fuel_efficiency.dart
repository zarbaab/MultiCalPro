import 'package:flutter/material.dart';

class FuelEfficiencyCalculator extends StatefulWidget {
  const FuelEfficiencyCalculator({super.key});

  @override
  _FuelEfficiencyCalculatorState createState() =>
      _FuelEfficiencyCalculatorState();
}

class _FuelEfficiencyCalculatorState extends State<FuelEfficiencyCalculator> {
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _fuelController = TextEditingController();
  String _efficiency = '';

  void _calculateEfficiency() {
    double distance = double.parse(_distanceController.text);
    double fuel = double.parse(_fuelController.text);
    double efficiency = distance / fuel;

    setState(() {
      _efficiency = 'Fuel Efficiency: ${efficiency.toStringAsFixed(2)} km/l';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Efficiency Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _distanceController,
              decoration: const InputDecoration(
                labelText: 'Enter distance traveled (km)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _fuelController,
              decoration: const InputDecoration(
                labelText: 'Enter fuel used (liters)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateEfficiency,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              _efficiency,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
