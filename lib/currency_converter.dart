import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _amountController = TextEditingController();
  String _convertedAmount = '';
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';

  final Map<String, double> _exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.75,
    'INR': 74.0,
  };

  void _convertCurrency() {
    double amount = double.parse(_amountController.text);
    double rate = _exchangeRates[_toCurrency]! / _exchangeRates[_fromCurrency]!;
    double convertedAmount = amount * rate;

    setState(() {
      _convertedAmount = convertedAmount.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Enter amount',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _fromCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _fromCurrency = newValue!;
                });
              },
              items: _exchangeRates.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _toCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _toCurrency = newValue!;
                });
              },
              items: _exchangeRates.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedAmount,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
