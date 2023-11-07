
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_flutter_way/Screen/tipcalculatorscreen.dart';

class TipCalculatorApp extends StatelessWidget {
  const TipCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const TipCalculatorScreen(title: "Tip Calculator"),
      );
  }

}