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
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/get_companies_use_case.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/register_client_use_case.dart';
import 'package:subul_manager_dashboard/features/register_client/presentation/manager/get_companies_cubit/get_companies_cubit.dart';
import 'package:subul_manager_dashboard/features/register_client/presentation/manager/register_client_cubit/register_client_cubit.dart';
import 'package:subul_manager_dashboard/features/register_client/presentation/views/widgets/company_picker.dart';

class RegisterationClient extends StatefulWidget {
  const RegisterationClient({super.key});

  @override
  State<RegisterationClient> createState() => _RegisterationClientState();
}

class _RegisterationClientState extends State<RegisterationClient> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var genderController = TextEditingController();
  var timeZoneController = TextEditingController();
  int? selectedCompanyId;

  var formKey = GlobalKey<FormState>();
  XFile? profileImage;
  XFile? identityImage;

  Uint8List? imageBytesProfile;
  Uint8List? imageBytesIdentity;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    genderController.dispose();
    timeZoneController.dispose();
    super.dispose();
  }

  Future<void> pickImage(bool isProfile) async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage != null) {
      final Uint8List bytes = await selectedImage.readAsBytes();
      setState(() {
        if (isProfile) {
          profileImage = selectedImage;
          imageBytesProfile = bytes;
        } else {
          identityImage = selectedImage;
          imageBytesIdentity = bytes;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterClientCubit(sl.get<RegisterClientUseCase>()),
      child: BlocConsumer<RegisterClientCubit, RegisterClientState>(
        listener: (context, state) {
          if (state is RegisterClientFailure) {
            showSnackBar(context, state.message, Colors.red);
          }
          if (state is RegisterClientSuccess) {
            showSnackBar(
              context,
              state.registerClientEntity.message,
              Colors.green,
            );
          }
        },
        builder: (context, state) {
          bool isLoading = state is RegisterClientLoading;
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
                        "إدخال بيانات العميل",
                        style: Styles.textStyle6Sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height / 12),
                CustomTextField(
                  label: 'الاسم الأول :',
                  keyboardType: TextInputType.name,
                  controller: firstNameController,
                ),
                SizedBox(height: size.height / 70),
                CustomTextField(
                  label: 'الاسم الأخير :',
                  keyboardType: TextInputType.name,
                  controller: lastNameController,
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
                  label: ' الجنس  :',
                  keyboardType: TextInputType.text,
                  controller: genderController,
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
                      label: 'أدخل صورة الهوية',
                      onTap: () => pickImage(false),
                      imageBytes: imageBytesIdentity,
                    ),
                    SizedBox(width: size.width / 120),
                    UploadImage(
                      label: 'أدخل صورتك الشخصية',
                      onTap: () => pickImage(true),
                      imageBytes: imageBytesProfile,
                    ),
                  ],
                ),
                SizedBox(height: size.height / 20),
                BlocProvider(
                  create:
                      (context) =>
                          GetCompaniesCubit(sl.get<GetCompaniesUseCase>())
                            ..getCompanies(),
                  child: CompanyPicker(
                    onCompanySelected: (int companyId) {
                      selectedCompanyId = companyId;
                    },
                  ),
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

                      if (identityImage == null) {
                        showSnackBar(
                          context,
                          'يرجى إدخال صورة الهوية',
                          Colors.red,
                        );
                        return;
                      }

                      if (selectedCompanyId == null) {
                        showSnackBar(context, 'يرجى اختيار الشركة', Colors.red);
                        return;
                      }

                      await context.read<RegisterClientCubit>().registerClient(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        gender: genderController.text,
                        address: addressController.text,
                        timeZone: timeZoneController.text,
                        prophilePhoto: profileImage!,
                        identityPhoto: identityImage!,
                        idCompany: selectedCompanyId!,
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
