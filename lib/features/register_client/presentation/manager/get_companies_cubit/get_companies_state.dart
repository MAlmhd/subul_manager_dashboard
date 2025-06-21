part of 'get_companies_cubit.dart';

sealed class GetCompaniesState extends Equatable {
  const GetCompaniesState();

  @override
  List<Object> get props => [];
}

final class GetCompaniesInitial extends GetCompaniesState {}

final class GetCompaniesFailure extends GetCompaniesState {
  final String message;

  const GetCompaniesFailure(this.message);
}

final class GetCompaniesLoading extends GetCompaniesState {}

final class GetCompaniesSuccess extends GetCompaniesState {
  final List<CompanyEntity> companies;

  const GetCompaniesSuccess(this.companies);
}
