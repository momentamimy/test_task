import 'package:test_task/modules/home/domain/entities/article.dart';

abstract class BaseArticlesRepository {
  Future<List<Article>> getFirstArticles();
  Future<List<Article>> getSecondArticles();
}