import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/routing/routes.dart';
import 'package:subul_manager_dashboard/features/home_view/presentation/views/home_view.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/track_shipments_home.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/pay_the_bill.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.trackShipmentsHome:
        return MaterialPageRoute(builder: (_) => TrackShipmentsHome());
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => HomeView());
      case Routes.payTheBill:
        final shipment = arguments as ApprovedShipmentEntity;
        return MaterialPageRoute(builder: (context) => PayTheBill(approvedShipmentEntity: arguments,));
      default:
        return null;
    }
  }
}
