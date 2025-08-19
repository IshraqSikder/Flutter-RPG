import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  // final List<Character> _characters = [
  //   Character(Vocation.wizard, id: '1', name: 'Klara', slogan: 'Kapumf!'),
  //   Character(
  //     Vocation.junkie,
  //     id: '2',
  //     name: 'Jonny',
  //     slogan: 'Light me up...',
  //   ),
  //   Character(
  //     Vocation.raider,
  //     id: '3',
  //     name: 'Crimson',
  //     slogan: 'Fire in the hole!',
  //   ),
  //   Character(
  //     Vocation.ninja,
  //     id: '4',
  //     name: 'Shaun',
  //     slogan: 'Alright then gang.',
  //   ),
  // ];

  final List<Character> _characters = [];

  get characters => _characters;

  // add character
  void addCharacter(Character character) async {
    await FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  // initially fetch characters
  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }

      notifyListeners();
    }
  }

  // save (update) character
  Future<void> saveCharacter(character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  // remove character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }
}
