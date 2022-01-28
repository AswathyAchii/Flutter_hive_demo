import 'package:flutter/material.dart';
import 'package:hive_project/ui_designs/Widgets/add_person_widget.dart';
import 'package:hive_project/ui_designs/Widgets/list_person_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hive Project Demo")),
      body: SafeArea(
        child: Column(
          children: [
            AddPersonWidget(),
            const Expanded(
              child: ListPersonWidget(),
            )
          ],
        ),
      ),
    );
  }
}


