import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home.dart';
import 'package:flutter_rpg/theme.dart';

void main() {
  runApp(const Sandbox());
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter RPG', theme: primaryTheme, home: Home());
  }
}
