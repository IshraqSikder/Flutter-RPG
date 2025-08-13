import 'package:flutter_rpg/models/skills.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  // constructor
  Character(
    this.vocation, {
    required this.id,
    required this.name,
    required this.slogan,
  });

  // fields
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;
  final Vocation vocation;
  final List<Skill> skills = [];

  // getters
  bool get isfav => _isFav;

  //methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    if (!skills.contains(skill)) {
      skills.add(skill);
    }
  }
}

// dummy character data
List<Character> characters = [
  Character(Vocation.wizard, id: '1', name: 'Klara', slogan: 'Kapumf!'),
  Character(Vocation.junkie, id: '2', name: 'Jonny', slogan: 'Light me up...'),
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
