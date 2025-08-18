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
  final Vocation vocation;
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;
  final List<Skill> skills = [];

  // getters
  bool get isfav => _isFav;

  //methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}
