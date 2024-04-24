import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/ui/ui.dart';

enum Routes {
  splash,
  sign,
  login,
  home,
  profile,
  profileEdit,
  transactions,
}

extension RoutesExtension on Routes {
  String get name {
    switch (this) {
      case Routes.splash:
        return '/splash';
      case Routes.sign:
        return '/sign';
      case Routes.login:
        return '/login';
      case Routes.home:
        return '/home';
      case Routes.profile:
        return '/profile';
      case Routes.profileEdit:
        return 'edit';
      case Routes.transactions:
        return '/transactions';
    }
  }

  String get fullPath {
    switch (this) {
      case Routes.profileEdit:
        return '/profile/edit';
      default:
        return '';
    }
  }
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.splash.name,
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
            routes: [
              GoRoute(
                path: Routes.profileEdit.name,
                builder: (context, state) => const EditPage(),
              ),
            ],
          ),
          GoRoute(
            path: Routes.transactions.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TransactionsPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: Routes.splash.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashPage(),
        ),
      ),
      GoRoute(
        path: Routes.login.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: Routes.sign.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignUpPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const Text('Not found'),
  );

  static GoRouter get router => _router;

  static void showError({required String message}) {
    final context = _rootNavigatorKey.currentContext!;
    final snackBar = SnackBar(
      backgroundColor: context.colorScheme.errorContainer,
      content: Text(
        message,
        style: SMobillsTextStyles.body1.copyWith(
          color: context.colorScheme.onErrorContainer,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  static void showSuccess({required String message}) {
    final context = _rootNavigatorKey.currentContext!;
    final snackBar = SnackBar(
      backgroundColor: Colors.green.shade900,
      content: Text(
        message,
        style: SMobillsTextStyles.body1.copyWith(
          color: Colors.white70,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}
