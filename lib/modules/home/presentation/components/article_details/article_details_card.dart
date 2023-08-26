import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task/core/utils/utils.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';

class ArticleDetailsCard extends StatelessWidget {
  final Article article;

  const ArticleDetailsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: article.urlToImage ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    Utils.getDateTimeFormat(article.publishedAt ?? ""),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      article.title ?? "",
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "By ${article.author ?? ""}",
                      style:
                          const TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            article.description ?? " ",
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
