import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                         theme: ThemeData(
                           primarySwatch: Colors.green,
                      ),
                      home: const CalculateScreen(title: 'First Assignment'));
  }
}

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key, required this.title});

  final String title;

  @override
  State<CalculateScreen> createState() => _CalculateState();
}

class _CalculateState extends State<CalculateScreen> {
  double _answer = 0.0;
  var firstInputController = TextEditingController();
  var secondInputController = TextEditingController(); 

   void addNumbers(double num1, double num2) => setState(() {
      _answer = num1 + num2;
    });

     void subtract(double num1, double num2) => setState(() {
        _answer = num1 - num2;
     });

    void multiply(double num1, double num2) => setState(() {    
       _answer = num1 * num2;
     });

    void divide(double num1, double num2) => setState(() {
       _answer = num1 / num2;
    });

    @override
    Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    getFlexibleTextfield('First Number', firstInputController),
                    const SizedBox(
                      width: 10,
                    ),
                    getFlexibleTextfield('Second Number', secondInputController),
                    ]
                  )
                 ,
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getButton("+", (){
                        addNumbers(double.parse(firstInputController.text),
                            double.parse(secondInputController.text));
                      }),
                      getButton("-", (){
                        subtract(double.parse(firstInputController.text),
                            double.parse(secondInputController.text));
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getButton("X", (){
                        multiply(double.parse(firstInputController.text),
                            double.parse(secondInputController.text));
                      }),
                      getButton("/", (){
                        divide(double.parse(firstInputController.text),
                            double.parse(secondInputController.text));
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    "$_answer",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // MARK:- Return Textfield with decoration
  Flexible getFlexibleTextfield(String text, TextEditingController controller) {
    return  Flexible(
                  child: TextField(
                  controller: controller,
                  decoration: InputDecoration(border: const OutlineInputBorder(),
                              labelText: text),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ]
                ),
                );
  }

 // MARK:- Return button with callback
  ElevatedButton getButton(String text, VoidCallback callback) {
        return ElevatedButton(
                        child: Text(text),
                        onPressed: () => {callback()},
                      );
  }
}
