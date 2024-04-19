import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/app/app.dart';
import 'package:s_mobills/bootstrap.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/ui/ui.dart';

void main() async {
  FlavorConfig(
    name: 'STG',
    color: Colors.yellow,
    location: BannerLocation.bottomStart,
    variables: {
      'baseUrl': Constants.stg.baseUrl,
    },
  );

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
