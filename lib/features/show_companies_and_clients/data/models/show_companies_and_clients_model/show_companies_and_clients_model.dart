import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';

class CompaniesAndClientsModel extends CompaniesAndClientsEntity {
  int? id2;
  String? role2;
  dynamic parentCompanyId;
  String? firstName2;
  dynamic lastName2;
  String? email;
  String? phone;
  dynamic phoneVerifiedAt;
  dynamic gender;
  String? address;
  int? status;
  String? timezone;
  dynamic profilePhotoPath;
  dynamic identityPhotoPath;
  String? customerCode;
  dynamic fcmToken;
  dynamic verifiedCode;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  CompaniesAndClientsModel({
    this.id2,
    this.role2,
    this.parentCompanyId,
    this.firstName2,
    this.lastName2,
    this.email,
    this.phone,
    this.phoneVerifiedAt,
    this.gender,
    this.address,
    this.status,
    this.timezone,
    this.profilePhotoPath,
    this.identityPhotoPath,
    this.customerCode,
    this.fcmToken,
    this.verifiedCode,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : super(id: id2! , role: role2! , firstName: firstName2!,lastName: lastName2 ?? "");

  factory CompaniesAndClientsModel.fromJson(Map<String, dynamic> json) {
    return CompaniesAndClientsModel(
      id2: json['id'] as int?,
      role2: json['role'] as String?,
      parentCompanyId: json['parent_company_id'] as dynamic,
      firstName2: json['first_name'] as String?,
      lastName2: json['last_name'] as dynamic,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      phoneVerifiedAt: json['phone_verified_at'] as dynamic,
      gender: json['gender'] as dynamic,
      address: json['address'] as String?,
      status: json['status'] as int?,
      timezone: json['timezone'] as String?,
      profilePhotoPath: json['profile_photo_path'] as dynamic,
      identityPhotoPath: json['identity_photo_path'] as dynamic,
      customerCode: json['customer_code'] as String?,
      fcmToken: json['FCM_TOKEN'] as dynamic,
      verifiedCode: json['verified_code'] as dynamic,
      emailVerifiedAt: json['email_verified_at'] as dynamic,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id2,
    'role': role2,
    'parent_company_id': parentCompanyId,
    'first_name': firstName2,
    'last_name': lastName2,
    'email': email,
    'phone': phone,
    'phone_verified_at': phoneVerifiedAt,
    'gender': gender,
    'address': address,
    'status': status,
    'timezone': timezone,
    'profile_photo_path': profilePhotoPath,
    'identity_photo_path': identityPhotoPath,
    'customer_code': customerCode,
    'FCM_TOKEN': fcmToken,
    'verified_code': verifiedCode,
    'email_verified_at': emailVerifiedAt,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'deleted_at': deletedAt,
  };
}
