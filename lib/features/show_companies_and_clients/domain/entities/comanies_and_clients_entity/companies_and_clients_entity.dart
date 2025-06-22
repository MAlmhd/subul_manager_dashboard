import 'package:hive/hive.dart';
part 'companies_and_clients_entity.g.dart';

@HiveType(typeId: 1) 
class CompaniesAndClientsEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String role;

  @HiveField(2)
  final String firstName;

  @HiveField(3)
  final String? lastName;

  CompaniesAndClientsEntity({
    required this.id,
    required this.role,
    required this.firstName,
    this.lastName,
  });
}
