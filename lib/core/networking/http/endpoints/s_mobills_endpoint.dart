import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/core/networking/http/endpoints/auth_endpoint.dart';

@immutable
class SMobillsEndpoint {
  const SMobillsEndpoint._();

  static String get baseUrl {
    return FlavorConfig.instance.variables['baseUrl'] as String;
  }

  /// Returns the path for an authentication [endpoint].
  static String auth(AuthEndpoint endpoint) {
    const path = '/auth';
    switch (endpoint) {
      case AuthEndpoint.login:
        return '$path/login';
      case AuthEndpoint.logout:
        return '$path/logout';
    }
  }
}
