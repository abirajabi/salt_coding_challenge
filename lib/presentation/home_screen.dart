import 'package:flutter/material.dart';
import 'package:salt_coding_challenge/presentation/news_detail_screen.dart';
import 'package:salt_coding_challenge/presentation/saved_news_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HomeScreen"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [],

      ),
    );
  }
}
