import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:subul_manager_dashboard/features/sign_in/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:subul_manager_dashboard/features/sign_in/presentation/views/widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignInCubit(sl<SignInUseCase>()),
        child: const SignInBody(),
      ),
    );
  }
}
