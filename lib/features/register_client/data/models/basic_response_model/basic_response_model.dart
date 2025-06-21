import 'package:subul_manager_dashboard/features/register_client/domain/entites/basic_response_entity/basic_response_entity.dart';

class RegisterClientModel extends RegisterClientEntity {
  bool? success;
  int? status;
  String? messageFromModel;
  dynamic data;

  RegisterClientModel({
    this.success,
    this.status,
    this.messageFromModel,
    this.data,
  }) : super(message: messageFromModel ?? "No message");

  factory RegisterClientModel.fromJson(Map<String, dynamic> json) {
    return RegisterClientModel(
      success: json['success'] as bool?,
      status: json['status'] as int?,
      messageFromModel: json['message'] as String?,
      data: json['data'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'status': status,
    'message': messageFromModel,
    'data': data,
  };
}
