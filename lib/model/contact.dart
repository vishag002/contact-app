import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 2)
class Contact {
  Contact({
    required this.name,
    required this.surname,
    required this.phone,
  });
  @HiveField(0)
  String name;

  @HiveField(1)
  String surname;

  @HiveField(2)
  String phone;
}
