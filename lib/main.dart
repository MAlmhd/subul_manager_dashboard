import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(

        locale: Locale('ar'),
        supportedLocales: [Locale('en')],


        debugShowCheckedModeBanner: false,
        title: 'Subul Manager Dashboard',
        theme: ThemeData(textTheme: GoogleFonts.almaraiTextTheme()),
        home: const HomeView(),
      ),
      
    );
  }
}

