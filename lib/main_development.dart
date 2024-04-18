import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    name: 'DEV',
    color: Colors.red,
    location: BannerLocation.topEnd,
    variables: {
      'baseUrl': Constants.dev.baseUrl,
    },
  );

  NetworkingDI.initializeDependencies();

  bootstrap(() => const App());
}
