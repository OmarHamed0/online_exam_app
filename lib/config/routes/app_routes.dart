import 'package:flutter/material.dart';
import 'package:online_exam/config/routes/page_route_name.dart';
class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.login:
        return _handleMaterialPageRoute(widget: Scaffold());
      default:
        return _handleMaterialPageRoute(widget: Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute(
      {required Widget widget}) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
