import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();
  double _totalAmount = 0;

  void _calculateTotal() {
    final double billAmount = double.parse(_billController.text);
    final double tipPercentage = double.parse(_tipController.text);
    setState(() {
      _totalAmount = billAmount + (billAmount * tipPercentage / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _billController,
              decoration: const InputDecoration(
                labelText: 'Bill Amount',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tipController,
              decoration: const InputDecoration(
                labelText: 'Tip Percentage',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: const Text('Calculate Total'),
            ),
            Text('Total Amount: $_totalAmount'),
          ],
        ),
      ),
    );
  }
}
