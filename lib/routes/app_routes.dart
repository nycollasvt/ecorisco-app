import 'package:flutter/material.dart';
import '../presentation/guide_profile/guide_profile.dart';
import '../presentation/active_tour_navigation/active_tour_navigation.dart';
import '../presentation/map_dashboard/map_dashboard.dart';

class AppRoutes {
  static const String initial = '/';
  static const String guideProfile = '/guide-profile';
  static const String activeTourNavigation = '/active-tour-navigation';
  static const String mapDashboard = '/map-dashboard';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const MapDashboard(), 
    guideProfile: (context) => const GuideProfile(),
    activeTourNavigation: (context) => const ActiveTourNavigation(),
    mapDashboard: (context) => const MapDashboard(),
  };
}
