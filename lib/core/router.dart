// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:flutterapp/core/router_constants.dart';

import 'package:flutterapp/views/error_screen/error_screen_view.dart' as view0;


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case errorScreenViewRoute:
        return MaterialPageRoute(builder: (_) => view0.ErrorScreenView());
    
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
