import 'package:test_task/core/network_helper/network_connection.dart';
import 'package:test_task/core/network_helper/exceptions.dart';
import 'package:test_task/modules/home/data/model/article_model.dart';
import 'package:dio/dio.dart';
import 'package:test_task/core/network_helper/apis.dart';

abstract class BaseArticlesRemoteDataSource {
  Future<List<ArticleModel>> getFirstArticles();

  Future<List<ArticleModel>> getSecondArticles();
}

class ArticlesRemoteDataSource extends BaseArticlesRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<ArticleModel>> getFirstArticles() async {
    await NetworkConnection.check();
    final response = ResponseStatusExceptions.handleResponseStatus(
        await dio.get(Apis.fetchFirstNewsApi));
    final firstArticlesList = (response.data['articles'] as List)
        .map((article) => ArticleModel.fromJson(article))
        .toList();
    return firstArticlesList;
  }

  @override
  Future<List<ArticleModel>> getSecondArticles() async {
    await NetworkConnection.check();
    final response = ResponseStatusExceptions.handleResponseStatus(
        await dio.get(Apis.fetchSecondNewsApi));
      final secondArticlesList = (response.data['articles'] as List)
          .map((article) => ArticleModel.fromJson(article))
          .toList();
      return secondArticlesList;
    }
}
