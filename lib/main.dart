import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
//firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_rpg/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ...
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
