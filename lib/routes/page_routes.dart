import 'package:flutter/material.dart';

class PageRoutes {
  static const String busesRoute = 'buses_route';

  Map<String, WidgetBuilder> routes() {
    return {
      busesRoute: (context) => Container(),
    };
  }
}
