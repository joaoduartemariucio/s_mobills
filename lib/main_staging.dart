import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/config/constants.dart';

void main() {
  FlavorConfig(
    name: 'STG',
    color: Colors.yellow,
    location: BannerLocation.bottomStart,
    variables: {
      'baseUrl': Constants.stg.baseUrl,
    },
  );

  bootstrap(() => const App());
}
