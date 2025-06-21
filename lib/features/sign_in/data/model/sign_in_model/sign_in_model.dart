

import 'package:subul_manager_dashboard/features/sign_in/domain/entites/sign_in_entity.dart';

class SignInModel extends SignInEntity {
	final bool? success;
	final int? status;
	final String? message;
	final String? data;

	 SignInModel({this.success, this.status, this.message, this.data}) : super(token: data!) ;

	factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
				success: json['success'] as bool?,
				status: json['status'] as int?,
				message: json['message'] as String?,
				data: json['data'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'status': status,
				'message': message,
				'data': data,
			};

	List<Object?> get props => [success, status, message, data];
}
