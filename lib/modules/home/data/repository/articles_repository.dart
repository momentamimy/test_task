import 'package:test_task/modules/home/data/data_source/articles_data_source.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';
import 'package:test_task/modules/home/domain/repository/BaseArticlesRepository.dart';

class ArticlesRepository extends BaseArticlesRepository {
  final BaseArticlesRemoteDataSource _articlesDataSource;

  ArticlesRepository({required BaseArticlesRemoteDataSource articlesDataSource})
      : _articlesDataSource = articlesDataSource;

  @override
  Future<List<Article>> getFirstArticles() {
    return _articlesDataSource.getFirstArticles();
  }

  @override
  Future<List<Article>> getSecondArticles() {
    return _articlesDataSource.getSecondArticles();
  }
}
