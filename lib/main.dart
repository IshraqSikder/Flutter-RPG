import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Sandbox());
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharacterStore(),
      child: MaterialApp(
        title: 'Flutter RPG',
        theme: primaryTheme,
        home: Home(),
      ),
    );
  }
}
