import 'package:cloud_firestore/cloud_firestore.dart';
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
  bool get isFav => _isFav;

  //methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // character to firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // get data from snapshot
    final data = snapshot.data()!;

    // make character instance
    Character character = Character(
      Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
      id: snapshot.id,
      name: data['name'],
      slogan: data['slogan'],
    );

    // update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkills(skill);
    }

    // set isFav
    if (data['isFav'] == true) {
      character.toggleIsFav();
    }

    // update stats & points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}
