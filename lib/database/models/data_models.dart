import 'package:hive/hive.dart';
part 'data_models.g.dart';

@HiveType(typeId: 1)
class PersonModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;

  PersonModel({
    required this.name,
    required this.age,
    this.id,
  });
}
