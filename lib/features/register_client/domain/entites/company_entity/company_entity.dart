import 'package:hive/hive.dart';
part 'company_entity.g.dart';
@HiveType(typeId: 0)
class CompanyEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int id;

  const CompanyEntity({required this.name,required this.id});
}
