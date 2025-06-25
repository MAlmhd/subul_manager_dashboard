import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/routing/app_router.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:subul_manager_dashboard/core/utils/simple_bloc_observer.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/company_entity/company_entity.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/comanies_and_clients_entity/companies_and_clients_entity.dart';
import 'package:subul_manager_dashboard/features/sign_in/presentation/views/sign_in_screen.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CompanyEntityAdapter());
  await Hive.openBox<CompanyEntity>(kCompaniesBox);
  Hive.registerAdapter(CompaniesAndClientsEntityAdapter());
  await Hive.openBox<CompaniesAndClientsEntity>(kCompaniesAndClients);
  Hive.registerAdapter(ApprovedShipmentEntityAdapter());
  await Hive.openBox<ApprovedShipmentEntity>(kApprovedShipments);
  setupServiceLocator();
  await initializeDateFormatting('ar', null);
  Bloc.observer = SimpleBlocObserver();
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
            home:  SignInScreen()
               // HomeView(), //WarehouseManager() //CreateShipment()// ShowAllShipments(), //// ReceivingShipments()// TrackShipmentsHome(), //const HomeView(),
          ),
    );
  }
}
