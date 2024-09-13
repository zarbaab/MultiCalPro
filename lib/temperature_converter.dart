import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _tempController = TextEditingController();
  String _convertedTemp = '';
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';

  void _convertTemperature() {
    double temp = double.parse(_tempController.text);
    double convertedTemp;

    if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
      convertedTemp = (temp * 9 / 5) + 32;
    } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
      convertedTemp = temp + 273.15;
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
      convertedTemp = (temp - 32) * 5 / 9;
    } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
      convertedTemp = (temp - 32) * 5 / 9 + 273.15;
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
      convertedTemp = temp - 273.15;
    } else if (_fromUnit == 'Kelvin' && _toUnit == 'Fahrenheit') {
      convertedTemp = (temp - 273.15) * 9 / 5 + 32;
    } else {
      convertedTemp = temp;
    }

    setState(() {
      _convertedTemp = convertedTemp.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tempController,
              decoration: const InputDecoration(
                labelText: 'Enter temperature',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _fromUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _fromUnit = newValue!;
                });
              },
              items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _toUnit,
              onChanged: (String? newValue) {
                setState(() {
                  _toUnit = newValue!;
                });
              },
              items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedTemp,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
