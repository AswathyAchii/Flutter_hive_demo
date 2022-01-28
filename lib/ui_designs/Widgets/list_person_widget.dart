import 'package:flutter/material.dart';

class ListPersonWidget extends StatelessWidget {
  const ListPersonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return ListTile(
            title: Text('Name $index'), subtitle: Text("Age $index"));
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: 50,
    );
  }
}
