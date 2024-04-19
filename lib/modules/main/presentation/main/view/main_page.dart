import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:s_mobills/core/navigation/cubit/navigation_cubit.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/l10n/l10n.dart';

class MainPage extends StatelessWidget {
  const MainPage({required this.screen, super.key});

  final Widget screen;

  BlocBuilder<NavigationCubit, NavigationState> _buildBottomNavigation(
    BuildContext context,
    List<NamedNavigationBarItemWidget> tabs,
  ) =>
      BlocBuilder<NavigationCubit, NavigationState>(
        buildWhen: (previous, current) => previous.index != current.index,
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (value) {
              if (state.index != value) {
                context.read<NavigationCubit>().getNavBarItem(value);
                context.go(tabs[value].initialLocation);
              }
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(
              size: IconTheme.of(context).size! * 1.3,
            ),
            items: tabs,
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen,
      bottomNavigationBar: _buildBottomNavigation(
        context,
        [
          NamedNavigationBarItemWidget(
            initialLocation: Routes.home.name,
            icon: const Icon(Icons.home_outlined),
            label: context.l10n.home,
          ),
          NamedNavigationBarItemWidget(
            initialLocation: Routes.transactions.name,
            icon: const Icon(Icons.receipt_long_outlined),
            label: context.l10n.transactions,
          ),
          NamedNavigationBarItemWidget(
            initialLocation: Routes.profile.name,
            icon: const Icon(Icons.person_outline),
            label: context.l10n.profile,
          ),
        ],
      ),
    );
  }
}

class NamedNavigationBarItemWidget extends BottomNavigationBarItem {
  NamedNavigationBarItemWidget({
    required this.initialLocation,
    required super.icon,
    super.label,
  });

  final String initialLocation;
}
