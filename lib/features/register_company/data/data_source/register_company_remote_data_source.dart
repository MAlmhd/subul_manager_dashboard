import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/features/register_company/data/models/basic_response_for_register_company_model.dart';
import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/entities/basic_response_for_register_compant.dart';

abstract class RegisterCompanyRemoteDataSource {
  Future<RegisterCompanyEntity> registerCompany({
    required String firstName,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
  });
}

class RegisterCompanyRemoteDataSourceImpl
    implements RegisterCompanyRemoteDataSource {
  final ApiService apiServicel;

  RegisterCompanyRemoteDataSourceImpl(this.apiServicel);
  @override
  Future<RegisterCompanyEntity> registerCompany({
    required String firstName,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
  }) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    final profileMultipart = MultipartFile.fromBytes(
      await prophilePhoto.readAsBytes(),
      filename: prophilePhoto.name,
    );
    FormData formData = FormData.fromMap({
      'first_name': firstName,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'timezone': timeZone,
      'profile_photo_path': profileMultipart,
      'is_company': 1,
    });

    var response = await apiServicel.post(
      endPoint: 'add/Customar',
      headers: {'Authorization': 'Bearer $token'},
      data: formData,
    );

    RegisterCompanyEntity registerCompanyEntity = RegisterCompanyModel.fromJson(
      response,
    );

    return registerCompanyEntity;
  }
}
