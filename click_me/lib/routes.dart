import 'package:flutter/material.dart';

import 'home_page.dart';
import 'leaderboard_page.dart';

class RouteGenerator { //PascalCase
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Extract the name of the route
    final String? routeName = settings.name;
    final routeData = settings.arguments as Map<String, dynamic>?;
    // Depending on the route name, return the appropriate MaterialPageRoute
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/leaderboard':
        return MaterialPageRoute(
          builder: (_) => const LeaderboardPage(),
          settings: settings,
        );
      default:
        // If the route is not defined, you can handle it here
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404: Route not found!'),
            ),
          ),
        );
    }
  }
}
