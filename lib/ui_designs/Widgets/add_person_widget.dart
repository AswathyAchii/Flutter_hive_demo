import 'package:flutter/material.dart';
import 'package:hive_project/database/functions/db_functions.dart';
import 'package:hive_project/database/models/data_models.dart';

class AddPersonWidget extends StatelessWidget {
  AddPersonWidget({
    Key? key,
  }) : super(key: key);
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              onAddStudentButtonClicked();
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Person"),
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    final _perosn = PersonModel(
      age: _age,
      name: _name,
    );
    addPerson(_perosn);
  }
}
