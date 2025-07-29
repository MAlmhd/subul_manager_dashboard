import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/use_case/show_companies_and_clients_use_case/show_companies_and_clients_use_case.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/use_case/delete_user_use_case/delete_user_use_case.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/presentation/manager/show_companies_and_clients_cubit/show_companies_and_clients_cubit.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/presentation/manager/delete_user_cubit/delete_user_cubit.dart';

class ShowCompaniesAndClients extends StatelessWidget {
  const ShowCompaniesAndClients({super.key});

  @override
  Widget build(BuildContext context) {
 

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ShowCompaniesAndClientsCubit(
            sl.get<ShowCompaniesAndClientsUseCase>(),
          )..showCompaniesAndClients(),
        ),
        BlocProvider(
          create: (_) => DeleteUserCubit(sl.get<DeleteUserUseCase>()),
        ),
      ],
      child: BlocListener<DeleteUserCubit, DeleteUserState>(
        listener: (context, deleteState) {
          if (deleteState is DeleteUserSuccess) {
           Fluttertoast.showToast(
                  msg: 'تم الحذف بنجاح',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
            context.read<ShowCompaniesAndClientsCubit>().showCompaniesAndClients();
          } else if (deleteState is DeleteUserFailure) {
            Fluttertoast.showToast(
                  msg: deleteState.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
          }
        },
        child: BlocBuilder<ShowCompaniesAndClientsCubit, ShowCompaniesAndClientsState>(
          builder: (context, state) {
            if (state is ShowCompaniesAndClientsSuccess) {
              final items = state.companiesAndClients;
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 30.h),
                    child: Column(
                      children: [
                        ...items.map((item) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withValues(alpha: 0.2),
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.grey[400]),
                                  onPressed: () {
                                    context.read<DeleteUserCubit>().deleteUser(id: item.id);
                                  },
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Text(
                                    "${item.firstName} ${item.lastName ?? ""}",
                                    style: Styles.textStyle6Sp.copyWith(
                                      color: AppColors.deepPurple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: item.role == "company"
                                        ? Colors.purple.withValues(alpha: 0.1)
                                        : Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    "(${item.role})",
                                    style: Styles.textStyle4Sp.copyWith(
                                      color: item.role == "company"
                                          ? AppColors.deepPurple
                                          : Colors.red[400],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const CustomProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
