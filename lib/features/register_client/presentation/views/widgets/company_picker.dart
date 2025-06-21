import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/core/widgets/show_error_message.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/presentation/manager/get_companies_cubit/get_companies_cubit.dart';
class CompanyPicker extends StatefulWidget {
  const CompanyPicker({super.key, required this.onCompanySelected});
  final void Function(int companyId) onCompanySelected;

  @override
  State<CompanyPicker> createState() => _CompanyPickerState();
}

class _CompanyPickerState extends State<CompanyPicker> {
  CompanyEntity? selectedCompany;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCompaniesCubit, GetCompaniesState>(
      builder: (context, state) {
        if (state is GetCompaniesSuccess) {
          return Center(
            child: PopupMenuButton<CompanyEntity>(
              onSelected: (company) {
                setState(() {
                  selectedCompany = company;
                });
                widget.onCompanySelected(company.id); // استدعِ القيمة المختارة
              },
              itemBuilder: (BuildContext context) {
                return state.companies.map((company) {
                  return PopupMenuItem<CompanyEntity>(
                    value: company,
                    child: Text(company.name),
                  );
                }).toList();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(selectedCompany?.name ?? 'اختر الشركة'),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          );
        } else if (state is GetCompaniesFailure) {
          return ShowErrorMessage(
            message: state.message,
            onPressed: () {
              context.read<GetCompaniesCubit>().getCompanies();
            },
          );
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
