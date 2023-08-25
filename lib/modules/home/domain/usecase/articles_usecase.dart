import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';
import 'package:test_task/modules/home/domain/repository/BaseArticlesRepository.dart';

class GetAllArticlesUseCase extends UseCase<List<Article>, NoParams> {
  final BaseArticlesRepository _articlesRepository;

  GetAllArticlesUseCase({required BaseArticlesRepository articlesRepository}):_articlesRepository=articlesRepository;

  @override
  Future<List<Article>> call(NoParams params) async {
    final responsesList = await Future.wait([
      _articlesRepository.getFirstArticles(),
      _articlesRepository.getSecondArticles()
    ]);

    return [...responsesList[0], ...responsesList[1]];
  }
}
