import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/ui/ui.dart';

void main() async {
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

  final theme = await SMobillsLoadTheme.load(
    'lib/resources/theme/s_mobills_theme.json',
  );

  final darkTheme = await SMobillsLoadTheme.load(
    'lib/resources/theme/s_mobills_theme_dark.json',
  );

  bootstrap(
    () => App(
      theme: theme,
      darkTheme: darkTheme,
    ),
  );
}
