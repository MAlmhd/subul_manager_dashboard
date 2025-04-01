import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/widgets/enter_code_widget.dart';

class EnterCodeForCompany extends StatelessWidget {
  const EnterCodeForCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: EnterCodeWidget(label: "الرمز الخاص بالعميل"));
  }
}
