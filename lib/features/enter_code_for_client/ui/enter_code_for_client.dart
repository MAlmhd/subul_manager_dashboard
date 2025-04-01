import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/widgets/enter_code_widget.dart';

class EnterCodeForClient extends StatelessWidget {
  const EnterCodeForClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: EnterCodeWidget(label: "أدخل الكود الخاص بك"));
  }
}
