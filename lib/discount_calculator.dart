import 'package:flutter/material.dart';

class DiscountCalculator extends StatefulWidget {
  const DiscountCalculator({super.key});

  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  final TextEditingController _originalPriceController =
      TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  String _finalPrice = '';

  void _calculateDiscount() {
    double originalPrice = double.parse(_originalPriceController.text);
    double discount = double.parse(_discountController.text);
    double discountAmount = originalPrice * (discount / 100);
    double finalPrice = originalPrice - discountAmount;

    setState(() {
      _finalPrice = 'Final Price: \$${finalPrice.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _originalPriceController,
              decoration: const InputDecoration(
                labelText: 'Enter original price',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _discountController,
              decoration: const InputDecoration(
                labelText: 'Enter discount percentage',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateDiscount,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              _finalPrice,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
