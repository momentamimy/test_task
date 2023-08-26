import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/core/utils/app_constants.dart';
import 'package:test_task/modules/home/presentation/components/home/article_card_list_item.dart';
import 'package:test_task/modules/home/presentation/provider/home_provider.dart';
import 'package:test_task/widgets/app_error_widget.dart';
import 'package:test_task/widgets/loading_card_list.dart';

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