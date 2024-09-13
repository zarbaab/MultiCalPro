import 'package:flutter/material.dart';

class SpeedDistanceTimeCalculator extends StatefulWidget {
  const SpeedDistanceTimeCalculator({super.key});

  @override
  _SpeedDistanceTimeCalculatorState createState() =>
      _SpeedDistanceTimeCalculatorState();
}

class _SpeedDistanceTimeCalculatorState
    extends State<SpeedDistanceTimeCalculator> {
  final TextEditingController _speedController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _result = '';

  void _calculate() {
    double? speed = _speedController.text.isNotEmpty
        ? double.tryParse(_speedController.text)
        : null;
    double? distance = _distanceController.text.isNotEmpty
        ? double.tryParse(_distanceController.text)
        : null;
    double? time = _timeController.text.isNotEmpty
        ? double.tryParse(_timeController.text)
        : null;

    if (speed != null && distance != null) {
      time = distance / speed;
      setState(() {
        _result = 'Time: ${time?.toStringAsFixed(2) ?? '0.00'} hours';
      });
    } else if (speed != null && time != null) {
      distance = speed * time;
      setState(() {
        _result = 'Distance: ${distance?.toStringAsFixed(2) ?? '0.00'} km';
      });
    } else if (distance != null && time != null) {
      speed = distance / time;
      setState(() {
        _result = 'Speed: ${speed?.toStringAsFixed(2) ?? '0.00'} km/h';
      });
    } else {
      setState(() {
        _result = 'Please enter at least two values.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Distance Time Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _speedController,
              decoration: const InputDecoration(
                labelText: 'Enter speed (km/h)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _distanceController,
              decoration: const InputDecoration(
                labelText: 'Enter distance (km)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Enter time (hours)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
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
