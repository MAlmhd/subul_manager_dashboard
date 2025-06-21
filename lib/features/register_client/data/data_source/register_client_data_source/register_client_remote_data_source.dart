import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/register_client/data/models/basic_response_model/basic_response_model.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/basic_response_entity/basic_response_entity.dart';

abstract class RegisterClientRemoteDataSource {
  Future<RegisterClientEntity> registerClient({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String address,
    required String timeZone,
    required XFile profilePhoto,
    required XFile identityPhoto,
    required int idCompany,
  });
}

class RegisterClientRemoteDataSourceImpl
    implements RegisterClientRemoteDataSource {
  final ApiService _apiService;

  RegisterClientRemoteDataSourceImpl(this._apiService);

  @override
  Future<RegisterClientEntity> registerClient({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String address,
    required String timeZone,
    required XFile profilePhoto,
    required XFile identityPhoto,
    required int idCompany,
  }) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    final profileMultipart = MultipartFile.fromBytes(
      await profilePhoto.readAsBytes(),
      filename: profilePhoto.name,
    );
    final identityMultipart = MultipartFile.fromBytes(
      await identityPhoto.readAsBytes(),
      filename: identityPhoto.name,
    );

    FormData formData = FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'gender': gender,
      'address': address,
      'timezone': timeZone,
      'profile_photo_path': profileMultipart,
      'identity_photo_path': identityMultipart,
      'is_company': 0,
      'parent_company_id': idCompany,
    });

    var response = await _apiService.post(
      endPoint: 'add/Customar',
      headers: {'Authorization': 'Bearer $token'},
      data: formData,
    );

    RegisterClientEntity registerClientEntity = RegisterClientModel.fromJson(
      response,
    );

    return registerClientEntity;
  }
}
