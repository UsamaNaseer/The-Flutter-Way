import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({super.key, required this.title});
  
  final String title;
  
  @override
  State<TipCalculatorScreen> createState() => _TipCalculateState();
}

class _TipCalculateState extends State<TipCalculatorScreen> {
  var controller = TextEditingController();
  var tip = 0.00;
  var total = 0.00;
  var sliderValue = 10.0;
  var billTextFieldState = "0.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
        padding: EdgeInsetsDirectional.all(16.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Enter bill amount"),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
               onChanged: (value) => setState(() {
                      billTextFieldState = value;
                      calculate();
                    })
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Select tip percentage"),
              Slider(
              value: sliderValue,
              label: sliderValue.round().toString(),
              divisions: 30,
              min: 0.0,
              max: 30.0,
              onChanged: (value) => setState(() {
                    sliderValue = value;
                    calculate();
            })),
            const SizedBox(height: 10),
            Text("Tip PKR: ${tip.toStringAsFixed(2)}"),
            Text("Total PKR: ${total.toStringAsFixed(2)}")
        ],
      ))
    )
    );
  }

  void calculate() {
    if (billTextFieldState.isNotEmpty) {
      var amount = double.parse(billTextFieldState);
      if (amount > 0) {
        tip = (amount * sliderValue) / 100;
        total = amount + tip;
      } else {
        emptyTotal();
      }
    } else {
      emptyTotal();
    }
  }

  void emptyTotal() {
    total = 0.0;
    tip = 0.0;
  }
}