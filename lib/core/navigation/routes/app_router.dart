import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:s_mobills/core/navigation/cubit/navigation_cubit.dart';
import 'package:s_mobills/modules/home/presentation/main/view/home_page.dart';
import 'package:s_mobills/modules/main/presentation/main/view/main_page.dart';
import 'package:s_mobills/modules/profile/presentation/main/view/profile_page.dart';
import 'package:s_mobills/modules/transactions/presentation/main/view/transactions_page.dart';

enum Routes {
  sign,
  login,
  home,
  profile,
  transactions,
}

extension RoutesExtension on Routes {
  String get name {
    switch (this) {
      case Routes.sign:
        return '/sign';
      case Routes.login:
        return '/login';
      case Routes.home:
        return '/home';
      case Routes.profile:
        return '/profile';
      case Routes.transactions:
        return '/transactions';
    }
  }
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.home.name,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => NavigationCubit(),
            child: MainPage(screen: child),
          );
        },
        routes: [
          GoRoute(
            path: Routes.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
            // routes: [
            //   GoRoute(
            //     path: Routes.homeDetailsNamedPage,
            //     builder: (context, state) => const HomeDetailsScreen(),
            //   ),
            // ],
          ),
          GoRoute(
            path: Routes.profile.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
            // routes: [
            //   GoRoute(
            //     path: Routes.profileDetailsNamedPage,
            //     builder: (context, state) => const ProfileDetailsScreen(),
            //   ),
            // ],
          ),
          GoRoute(
            path: Routes.transactions.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TransactionsPage(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const Text('Not founds'),
  );

  static GoRouter get router => _router;
}
