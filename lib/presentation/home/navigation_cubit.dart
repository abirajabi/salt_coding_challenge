import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/constants.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.headlineNews, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.headlineNews:
        emit(NavigationState(NavbarItem.headlineNews, 0));
        break;
      case NavbarItem.savedNews:
        emit(NavigationState(NavbarItem.savedNews, 1));
        break;
    }
  }
}
