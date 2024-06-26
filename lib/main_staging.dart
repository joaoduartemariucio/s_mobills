import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/wiring/modules_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    name: Constants.stg.name,
    color: Colors.yellow,
    location: BannerLocation.bottomStart,
    variables: {
      'baseUrl': Constants.stg.baseUrl,
    },
  );

  await NetworkingDI.initializeDependencies();
  ModulesDI.initializeDependencies();

  bootstrap(() => const App());
}
