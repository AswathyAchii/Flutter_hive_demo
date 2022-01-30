import 'package:flutter/material.dart';
import 'package:hive_project/database/functions/db_functions.dart';
import 'package:hive_project/database/models/data_models.dart';

class ListPersonWidget extends StatelessWidget {
  const ListPersonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: personlistNotifier,
      builder: (BuildContext ctx, List<PersonModel> personList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = personList[index];
            return ListTile(
              title: Text(data.name),
              subtitle: Text(data.age),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  if (data.id != null) {
                    deletePerson(data.id!);
                  } else {
                    print("Id is null");
                  }
                },
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: personList.length,
        );
      },
    );
  }
}
