import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/delete_user_entity/delete_user_entity.dart';

class DeleteUserModel extends DeleteUserEntity{
	bool? success;
	int? status;
	String? message2;
	dynamic data;

	DeleteUserModel({this.success, this.status, this.message2, this.data}) : super(message2 ?? "No message");

	factory DeleteUserModel.fromJson(Map<String, dynamic> json) {
		return DeleteUserModel(
			success: json['success'] as bool?,
			status: json['status'] as int?,
			message2: json['message'] as String?,
			data: json['data'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'status': status,
				'message': message2,
				'data': data,
			};
}
