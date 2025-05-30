import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subul_manager_dashboard/core/routing/app_router.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/receiving_shipments.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/show_all_shipments.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/create_shipment.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/warehouse_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            locale: Locale('ar'),
            supportedLocales: [Locale('en')],

            debugShowCheckedModeBanner: false,
            title: 'Subul Manager Dashboard',
            theme: ThemeData(textTheme: GoogleFonts.almaraiTextTheme()),
            home:WarehouseManager() //CreateShipment()// ShowAllShipments(), //// ReceivingShipments()// TrackShipmentsHome(), //const HomeView(),
          ),
    );
  }
}
