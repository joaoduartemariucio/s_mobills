import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/config/constants.dart';

void main() {
  FlavorConfig(
    name: 'PROD',
    color: Colors.green,
    location: BannerLocation.bottomStart,
    variables: {
      'baseUrl': Constants.prod.baseUrl,
    },
  );

  bootstrap(() => const App());
}
