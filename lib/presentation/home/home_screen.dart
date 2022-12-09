import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_coding_challenge/presentation/headlinenews/cubit/headline_news_cubit.dart';
import 'package:salt_coding_challenge/presentation/headlinenews/headline_news_screen.dart';
import 'package:salt_coding_challenge/presentation/home/navigation_cubit.dart';
import 'package:salt_coding_challenge/presentation/savednews/saved_news_screen.dart';

import '../../core/constants.dart';
import '../../core/servicelocator/injection_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  // final nilai = -105000.897;
  final nilai = [
    {"koin": -98795138.876}
  ];

  _HomeScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   // child: Text(nilai.withThousandsSeparator()),
      //   child: RichText(
      //       text: TextSpan(
      //           text: nilai[0]["koin"]?.withThousandsSeparator,
      //           style: TextStyle(
      //             color: Colors.red,
      //           ),
      //           children: [
      //         TextSpan(
      //             text: "Hasil with separator",
      //             style: TextStyle(color: Colors.blue))
      //       ])),
      // ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.headlineNews) {
            return BlocProvider(
              create: (context) {
                final cubit = getIt.get<HeadlineNewsCubit>();
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
