import 'package:flutter/material.dart';

import 'package:hive_project/database/models/data_models.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<PersonModel>> personlistNotifier = ValueNotifier([]);

Future<void> addPerson(PersonModel value) async {
  final personDB = await Hive.openBox<PersonModel>('Person_db');

  final _id = await personDB.add(value);
  value.id = _id;

  personlistNotifier.value.add(value);
  personlistNotifier.notifyListeners();
}

Future<void> getPerson() async {
  final personDB = await Hive.openBox<PersonModel>('Person_db');

  personlistNotifier.value.clear();
  personlistNotifier.value.addAll(personDB.values);
  personlistNotifier.notifyListeners();
}

Future<void> deletePerson(int id) async {
  final personDB = await Hive.openBox<PersonModel>('Person_db');
  await personDB.delete(id);
  getPerson();
}
