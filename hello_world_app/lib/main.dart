import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterFunctionsScreen(),
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(255, 128, 59, 255)),
    );
  }
}
