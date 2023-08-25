import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/core/utils/app_constants.dart';
import 'package:test_task/core/utils/utils.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';
import 'package:test_task/modules/home/domain/usecase/articles_usecase.dart';
import 'package:test_task/modules/home/home_di.dart';
import 'package:test_task/modules/home/presentation/components/drawer/home_drawer.dart';
import 'package:test_task/modules/home/presentation/provider/home_provider.dart';
import 'package:test_task/modules/home/presentation/screens/article_details_screen.dart';
import 'package:test_task/res.dart';
import 'package:test_task/widgets/app_error_widget.dart';
import 'package:test_task/widgets/loading_card_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            HomeProvider(articlesUseCase: hsl<GetAllArticlesUseCase>())
              ..getAllArticles(),
        builder: (context, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white.withOpacity(0.9),
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: Builder(
                  builder: (context) => // Ensure Scaffold is in context
                      IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer()),
                ),
                title: const Text("LINK DEVELOPMENT",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      Res.search,
                      width: 25,
                    ),
                  )
                ],
              ),
              drawer: const HomeDrawer(),
              body: const ArticlesListView(),
            ),
          );
        });
  }
}

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    switch (provider.status) {
      case AppConstants.errorStatus:
        return AppErrorWidget(
            msg: provider.onErrorMessage,
            onReload: () => provider.getAllArticles());
      case AppConstants.loadingStatus:
        return const LoadingCardList();
      case AppConstants.doneStatus:
        return ListView.builder(
          itemCount: provider.articlesList.length,
          itemBuilder: (context, index) => ArticleCardListItem(
            article: provider.articlesList[index],
          ),
        );
      default:
        return ListView.builder(
          itemCount: provider.articlesList.length,
          itemBuilder: (context, index) => ArticleCardListItem(
            article: provider.articlesList[index],
          ),
        );
    }
  }
}

class ArticleCardListItem extends StatelessWidget {
  final Article article;

  const ArticleCardListItem({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailsScreen(article: article),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  imageUrl: article.urlToImage ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    article.title ?? "",
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "By ${article.author ?? ""}",
                    style: const TextStyle(color: Colors.black45, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      Utils.getDateTimeFormat(article.publishedAt ?? ""),
                      style:
                          const TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
