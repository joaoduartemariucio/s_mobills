import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/core.dart';

void main() async {
  FlavorConfig(
    name: 'STG',
    color: Colors.yellow,
    location: BannerLocation.bottomStart,
    variables: {
      'baseUrl': Constants.stg.baseUrl,
    },
  );

  NetworkingDI.initializeDependencies();

  bootstrap(() => const App());
}
