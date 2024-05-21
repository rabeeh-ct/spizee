import 'package:flutter/material.dart';
import '../screens/landing_screen/landing_screen.dart';

import '../routes/route_constants.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/place_order_screen/place_order_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> get routes => {
        RouteList.initial: (context) => const LandingScreen(),
        RouteList.homeScreen: (context) => const HomeScreen(),
        RouteList.landingScreen: (context) => const LandingScreen(),
        RouteList.placeOrderScreen: (context) => const PlaceOrderScreen(),

      };
}
