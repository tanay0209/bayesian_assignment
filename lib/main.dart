import 'package:bayesian_assignment/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Bayesian(),
  );
}

class Bayesian extends StatelessWidget {
  const Bayesian({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
