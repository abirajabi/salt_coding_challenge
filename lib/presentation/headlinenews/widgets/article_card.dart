import 'package:flutter/material.dart';
import 'package:salt_coding_challenge/data/news_articles_result.dart';

import '../../newsdetail/news_detail_screen.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: article.urlToImage,
        child: Image.network(
          article.urlToImage,
          width: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, exception, stacktrace) {
            return Image.asset('assets/placeholder100.png');
          },
        ),
      ),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
      title: Text(
        article.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        article.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const NewsDetailScreen(),
            settings: RouteSettings(arguments: article)));
      },
    );
  }
}
