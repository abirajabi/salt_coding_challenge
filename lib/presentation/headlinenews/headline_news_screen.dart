import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_coding_challenge/core/widgets/center_error_screen.dart';
import 'package:salt_coding_challenge/core/widgets/center_loading_screen.dart';
import 'package:salt_coding_challenge/presentation/headlinenews/cubit/headline_news_cubit.dart';
import 'package:salt_coding_challenge/presentation/headlinenews/widgets/article_card.dart';

class HeadlineNewsScreen extends StatelessWidget {
  const HeadlineNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadlineNewsCubit, HeadlineNewsState>(
      builder: (context, state) {
        if (state is HeadlineNewsLoading) {
          return const CenterLoadingScreen(
              message: "Loading headline news ...");
        } else if (state is HeadlineNewsFailed) {
          return CenterErrorScreen(message: state.message);
        } else if (state is HeadlineNewsSuccess) {
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.blueAccent,
            onRefresh: () async {
              context.read<HeadlineNewsCubit>().init();
            },
            child: ListView.builder(
                itemCount: state.headlineNews.length,
                itemBuilder: (context, index) {
                  return ArticleCard(article: state.headlineNews[index]);
                }),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
