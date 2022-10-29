import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:salt_coding_challenge/domain/usecases/get_headline_news.dart';
import 'package:salt_coding_challenge/presentation/newsdetail/news_detail_screen.dart';
import 'package:salt_coding_challenge/presentation/savednews/saved_news_screen.dart';

import '../../../data/news_articles_result.dart';

part 'headline_news_state.dart';

const String serverFailureMessage = 'Server failure';
const String cacheFailureMessage = 'Cache failure';

class HeadlineNewsCubit extends Cubit<HeadlineNewsState> {
  final GetHeadlineNews getHeadlineNews;

  HeadlineNewsCubit(this.getHeadlineNews) : super(HeadlineNewsLoading());

  final List<Widget> bottomNavbarPage = const [
    NewsDetailScreen(),
    SavedNewsScreen()
  ];

  void init() async {
    emit(HeadlineNewsLoading());
    final result = await getHeadlineNews.execute();

    result.fold((failure) {
      emit(const HeadlineNewsFailed(serverFailureMessage));
    }, (news) {
      emit(HeadlineNewsSuccess(headlineNews: news));
    });
  }
}
