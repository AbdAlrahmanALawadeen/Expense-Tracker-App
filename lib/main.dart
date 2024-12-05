import 'package:flutter/material.dart';
import 'package:project/widgets/expenses.dart';

void main() {
  // todo App not allow to rotate
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((fn){
    runApp(
      const MaterialApp(
        home : Expenses(),
      ),
    );
  });*/

  runApp(
    const MaterialApp(
      home : Expenses(),
    ),
  );
  
}

