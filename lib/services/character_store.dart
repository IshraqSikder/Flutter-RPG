import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(Vocation.wizard, id: '1', name: 'Klara', slogan: 'Kapumf!'),
    Character(
      Vocation.junkie,
      id: '2',
      name: 'Jonny',
      slogan: 'Light me up...',
    ),
    Character(
      Vocation.raider,
      id: '3',
      name: 'Crimson',
      slogan: 'Fire in the hole!',
    ),
    Character(
      Vocation.ninja,
      id: '4',
      name: 'Shaun',
      slogan: 'Alright then gang.',
    ),
  ];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
