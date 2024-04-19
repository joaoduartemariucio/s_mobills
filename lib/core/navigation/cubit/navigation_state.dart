part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({required this.bottomNavItems, required this.index});

  final String bottomNavItems;
  final int index;

  @override
  List<Object> get props => [bottomNavItems, index];
}
