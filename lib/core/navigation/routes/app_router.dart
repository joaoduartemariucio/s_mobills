// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';
import 'package:s_mobills/modules/transactions/presentation/new_transaction/view/new_transaction_page.dart';
import 'package:s_mobills/ui/ui.dart';

enum Routes {
  splash,
  sign,
  login,
  home,
  profile,
  profileEdit,
  profileAccounts,
  profileAccountsCreate,
  transactions,
  newTransaction,
  categories
}

extension RoutesExtension on Routes {
  String get path {
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
      case Routes.profileAccounts:
        return 'accounts';
      case Routes.profileAccountsCreate:
        return 'create';
      case Routes.transactions:
        return '/transactions';
      case Routes.newTransaction:
        return 'new_transaction';
      case Routes.categories:
        return '/categories';
    }
  }

  String get name {
    switch (this) {
      case Routes.splash:
        return 'Splash';
      case Routes.sign:
        return 'Sign';
      case Routes.login:
        return 'Login';
      case Routes.home:
        return 'Home';
      case Routes.profile:
        return 'Profile';
      case Routes.profileEdit:
        return 'Edit';
      case Routes.profileAccounts:
        return 'Accounts';
      case Routes.profileAccountsCreate:
        return 'Create Account';
      case Routes.transactions:
        return 'Transactions';
      case Routes.newTransaction:
        return 'New Transaction';
      case Routes.categories:
        return 'Categories';
    }
  }
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.splash.path,
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
            name: Routes.home.name,
            path: Routes.home.path,
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
            name: Routes.transactions.name,
            path: Routes.transactions.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TransactionsPage(),
            ),
            routes: [
              GoRoute(
                name: Routes.newTransaction.name,
                path: Routes.newTransaction.path,
                builder: (context, state) {
                  final extras = state.extra! as Map<String, dynamic>;
                  final transactionType = extras['type'] as TransactionType;
                  return NewTransactionPage(transactionType: transactionType);
                },
              ),
            ],
          ),
          GoRoute(
            name: Routes.profile.name,
            path: Routes.profile.path,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(),
            ),
            routes: [
              GoRoute(
                name: Routes.profileEdit.name,
                path: Routes.profileEdit.path,
                builder: (context, state) => const EditPage(),
              ),
              GoRoute(
                name: Routes.profileAccounts.name,
                path: Routes.profileAccounts.path,
                builder: (context, state) => const AccountsPage(),
                routes: [
                  GoRoute(
                    name: Routes.profileAccountsCreate.name,
                    path: Routes.profileAccountsCreate.path,
                    builder: (context, state) => const CreateAccountPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashPage(),
        ),
      ),
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.path,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: Routes.sign.name,
        path: Routes.sign.path,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignUpPage(),
        ),
      ),
      GoRoute(
        name: Routes.categories.name,
        path: Routes.categories.path,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TransactionsPage(),
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
