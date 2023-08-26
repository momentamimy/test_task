import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';
import 'package:test_task/modules/home/presentation/components/article_details/article_details_card.dart';
import 'package:test_task/modules/home/presentation/components/article_details/open_url_button.dart';
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
                child: OpenUrlButton(onTap: _launchUrl),
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

