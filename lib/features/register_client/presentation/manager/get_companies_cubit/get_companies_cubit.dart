import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/get_companies_use_case.dart';

part 'get_companies_state.dart';

class GetCompaniesCubit extends Cubit<GetCompaniesState> {
  GetCompaniesCubit(this.getCompaniesUseCase) : super(GetCompaniesInitial());
  final GetCompaniesUseCase getCompaniesUseCase;

  Future<void> getCompanies() async {
    emit(GetCompaniesLoading());
    var data = await getCompaniesUseCase.call();
    data.fold(
      (failure) {
        emit(GetCompaniesFailure(failure.message));
      },
      (companies) {
        emit(GetCompaniesSuccess(companies));
      },
    );
  }
}
