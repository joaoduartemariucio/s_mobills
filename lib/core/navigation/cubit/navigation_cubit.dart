import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(
          NavigationState(
            bottomNavItems: Routes.home.name,
            index: 0,
          ),
        );

  void getNavBarItem(int index) {
    switch (index) {
      case 0:
        emit(
          NavigationState(
            bottomNavItems: Routes.home.name,
            index: 0,
          ),
        );

      case 1:
        emit(
          NavigationState(
            bottomNavItems: Routes.transactions.name,
            index: 1,
          ),
        );

      case 2:
        emit(
          NavigationState(
            bottomNavItems: Routes.profile.name,
            index: 2,
          ),
        );
    }
  }
}
