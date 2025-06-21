import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/entities/basic_response_for_register_compant.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/use_case/register_company_use_case.dart';

part 'register_company_state.dart';

class RegisterCompanyCubit extends Cubit<RegisterCompanyState> {
  RegisterCompanyCubit(this.registerCompanyUseCase)
    : super(RegisterCompanyInitial());
  final RegisterCompanyUseCase registerCompanyUseCase;

  Future<void> registerCompany({
    required String firstName,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
  }) async {
    emit(RegisterCompanyLoading());
    RegisterCompanyParams registerCompanyParams = RegisterCompanyParams(
      firstName,
      email,
      password,
      phone,
      address,
      timeZone,
      prophilePhoto,
    );
    var result = await registerCompanyUseCase.call(registerCompanyParams);
    result.fold(
      (failure) {
        emit(RegisterCompanyFailure(failure.message));
      },
      (success) {
        emit(RegisterCompanySuccess(success));
      },
    );
  }
}
