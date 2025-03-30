import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subul Manager Dashboard',
      home: const HomeView(),
    );
  }
}

