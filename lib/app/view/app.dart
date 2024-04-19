import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.theme,
    required this.darkTheme,
    super.key,
  });

  final ThemeData theme;
  final ThemeData darkTheme;

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp.router(
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}
