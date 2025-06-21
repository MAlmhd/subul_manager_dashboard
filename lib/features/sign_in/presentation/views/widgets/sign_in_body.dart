import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/extensions.dart';
import 'package:subul_manager_dashboard/core/routing/routes.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_text_field.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/sign_in/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text;
      await context.read<SignInCubit>().signIn(
        email: email,
        password: password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BlocConsumer<SignInCubit, SignInState>(
        builder: (context, state) {
          final isLoading = state is SignInLoadingState;
          return Container(
            width: double.infinity,
            height: 900.h,
            decoration: BoxDecoration(color: AppColors.lightGray),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLogo(),
                  SizedBox(height: size.height * 0.1),
                  SizedBox(
                    width: size.width * 0.7,
                    child: CustomTextField(
                      label: 'البريد الإلكتروني ',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال البريد الإلكتروني';
                        } else if (!value.contains('@')) {
                          return 'البريد الإلكتروني غير صالح';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(
                    width: size.width * 0.7,
                    child: CustomTextField(
                      label: 'كلمة المرور ',
                      keyboardType: TextInputType.visiblePassword,
                      securePassword: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمة المرور';
                        } else if (value.length < 6) {
                          return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  isLoading
                      ? CustomProgressIndicator()
                      : CustomOkButton(
                        onTap: _onSignIn,
                        color: AppColors.goldenYellow,
                        label: 'تسجيل الدخول',
                      ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, SignInState state) {
          if (state is SignInSuccessState) {
            
            showSnackBar(context,'تم تسجيل الدخول بنجاح',Colors.green);
            Future.delayed(Duration(seconds: 2));
            context.pushNamedAndRemoveUntil(
              Routes.homeView,
              predicate: (route) => false,
            );
            // Navigate to another screen if needed
          } else if (state is SignInFailureState) {
           
            showSnackBar(context,'فشل تسجيل الدخول: ${state.message}',Colors.red,);
          }
        },
      ),
    );
  }
}
