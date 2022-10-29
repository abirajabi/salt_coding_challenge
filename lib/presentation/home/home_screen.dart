import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_coding_challenge/core/servicelocator/injection_container.dart';
import 'package:salt_coding_challenge/presentation/home/navigation_cubit.dart';

import '../../core/constants.dart';
import '../headlinenews/cubit/headline_news_cubit.dart';
import '../headlinenews/headline_news_screen.dart';
import '../savednews/saved_news_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.headlineNews) {
            return BlocProvider(
              create: (context) {
                final cubit = sl.get<HeadlineNewsCubit>();
                cubit.init();
                return cubit;
              },
              child: const HeadlineNewsScreen(),
            );
          } else if (state.navbarItem == NavbarItem.savedNews) {
            return SavedNewsScreen();
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Headline"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.save_sharp), label: "Bookmarked")
            ],
            onTap: (index) {
              if (index == 0) {
                context
                    .read<NavigationCubit>()
                    .getNavBarItem(NavbarItem.headlineNews);
              } else if (index == 1) {
                context
                    .read<NavigationCubit>()
                    .getNavBarItem(NavbarItem.savedNews);
              }
            },
          );
        },
      ),
    );
  }
}
