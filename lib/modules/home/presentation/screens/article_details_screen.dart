import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/core/utils/utils.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';
import 'package:test_task/res.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon:
                        const Icon(Icons.arrow_back_sharp, color: Colors.white),
                    onPressed: () => Navigator.pop(context)),
          ),
          title: const Text("LINK DEVELOPMENT",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                Res.search,
                width: 30,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Expanded(child: ArticleDetailsCard(article: article)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: () => _launchUrl(),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: Colors.black),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text("OPEN WEBSITE",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(article.url ?? ""), mode: LaunchMode.externalApplication)) {
      Fluttertoast.showToast(msg: "Could not launch the website");
    }
  }
}

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
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: article.urlToImage ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        Utils.getDateTimeFormat(article.publishedAt ?? ""),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
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
