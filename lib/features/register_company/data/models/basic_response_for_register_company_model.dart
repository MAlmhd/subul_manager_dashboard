import 'package:subul_manager_dashboard/features/register_company/domain/entities/basic_response_for_register_compant.dart';

class RegisterCompanyModel extends RegisterCompanyEntity {
  bool? success;
  int? status;
  String? message2;
  dynamic data;

  RegisterCompanyModel({this.success, this.status, this.message2, this.data})
    : super(message2 ?? "No message");

  factory RegisterCompanyModel.fromJson(Map<String, dynamic> json) {
    return RegisterCompanyModel(
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
