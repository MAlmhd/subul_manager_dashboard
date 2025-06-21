import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_text_field.dart';
import 'package:subul_manager_dashboard/core/widgets/upload_image.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/register_client_use_case.dart';
import 'package:subul_manager_dashboard/features/register_client/presentation/manager/register_client_cubit/register_client_cubit.dart';
import 'package:subul_manager_dashboard/features/register_company/domain/use_case/register_company_use_case.dart';
import 'package:subul_manager_dashboard/features/register_company/presentation/manager/register_company_cubit/register_company_cubit.dart';

class RegisterCompanyScreen extends StatefulWidget {
  const RegisterCompanyScreen({super.key});

  @override
  State<RegisterCompanyScreen> createState() => _RegisterCompanyScreenState();
}

class _RegisterCompanyScreenState extends State<RegisterCompanyScreen> {
  var firstNameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var timeZoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  XFile? profileImage;

  Uint8List? imageBytesProfile;

  @override
  void dispose() {
    firstNameController.dispose();

    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    timeZoneController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage != null) {
      final Uint8List bytes = await selectedImage.readAsBytes();
      setState(() {
        profileImage = selectedImage;
        imageBytesProfile = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create:
          (context) => RegisterCompanyCubit(sl.get<RegisterCompanyUseCase>()),
      child: BlocConsumer<RegisterCompanyCubit, RegisterCompanyState>(
        listener: (context, state) {
          if (state is RegisterCompanyFailure) {
            showSnackBar(context, state.message, Colors.red);
          }
          if (state is RegisterCompanySuccess) {
            showSnackBar(
              context,
              state.registerCompanyEntity.message,
              Colors.green,
            );
          }
        },
        builder: (context, state) {
          bool isLoading = state is RegisterCompanyLoading;
          return Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.goldenYellow,
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: Center(
                      child: Text(
                        "إدخال بيانات الشركة",
                        style: Styles.textStyle6Sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height / 12),
                CustomTextField(
                  label: 'اسم الشركة  :',
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                ),

                SizedBox(height: size.height / 70),
                CustomTextField(
                  label: 'العنوان  :',
                  keyboardType: TextInputType.streetAddress,
                  controller: addressController,
                ),
                SizedBox(height: size.height / 70),
                CustomTextField(
                  label: 'رقم الهاتف  :',
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
                SizedBox(height: size.height / 70),
                CustomTextField(
                  label: 'البريد الإلكتروني   :',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(height: size.height / 70),
                CustomTextField(
                  label: 'كلمة المرور  :',
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                ),

                SizedBox(height: size.height / 70),
                CustomTextField(
                  label: ' الحالة المنطقة الزمنية  :',
                  keyboardType: TextInputType.text,
                  controller: timeZoneController,
                ),
                SizedBox(height: size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UploadImage(
                      label: 'أدخل صورتك الشخصية',
                      onTap: () => pickImage(),
                      imageBytes: imageBytesProfile,
                    ),
                  ],
                ),

                SizedBox(height: size.height / 20),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      if (!formKey.currentState!.validate()) {
                        debugPrint('بعض الحقول النصية ناقصة أو غير صحيحة');
                        return;
                      }

                      if (profileImage == null) {
                        showSnackBar(
                          context,
                          'يرجى إدخال صورتك الشخصية',
                          Colors.red,
                        );
                        return;
                      }

                     await context.read<RegisterCompanyCubit>().registerCompany(
                        firstName: firstNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        address: addressController.text,
                        timeZone: timeZoneController.text,
                        prophilePhoto: profileImage!,
                      );
                    },

                    child:
                        isLoading
                            ? CustomProgressIndicator()
                            : Container(
                              width: 60.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.goldenYellow,
                                borderRadius: BorderRadius.circular(
                                  cornerRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'موافق',
                                  style: Styles.textStyle4Sp.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                  ),
                ),
                SizedBox(height: size.height / 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
