import 'package:flutter/material.dart';
import 'package:subul_manager_dashboard/core/routing/routes.dart';
import 'package:subul_manager_dashboard/features/home_view/presentation/views/home_view.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/track_shipments_home.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.trackShipmentsHome:
        return MaterialPageRoute(builder: (_) => TrackShipmentsHome());
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => HomeView());

      default:
        return null;
    }
  }
}
