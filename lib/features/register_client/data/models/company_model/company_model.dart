import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';

class CompanyModel extends CompanyEntity{
	int? companyId;
	String? role;
	String? firstName;
	String? email;
	String? phone;
	String? address;
	String? timezone;
	dynamic profilePhotoPath;

	CompanyModel({
		this.companyId, 
		this.role, 
		this.firstName, 
		this.email, 
		this.phone, 
		this.address, 
		this.timezone, 
		this.profilePhotoPath, 
	}) : super(name: firstName ?? "", id: companyId ?? 0);

	factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
				companyId: json['id'] as int?,
				role: json['role'] as String?,
				firstName: json['first_name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				address: json['address'] as String?,
				timezone: json['timezone'] as String?,
				profilePhotoPath: json['profile_photo_path'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': companyId,
				'role': role,
				'first_name': firstName,
				'email': email,
				'phone': phone,
				'address': address,
				'timezone': timezone,
				'profile_photo_path': profilePhotoPath,
			};
}
