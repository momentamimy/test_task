
import 'package:get_it/get_it.dart';
import 'package:test_task/modules/home/data/data_source/articles_data_source.dart';
import 'package:test_task/modules/home/data/repository/articles_repository.dart';
import 'package:test_task/modules/home/domain/repository/BaseArticlesRepository.dart';
import 'package:test_task/modules/home/domain/usecase/articles_usecase.dart';

final hsl = GetIt.instance;

class HomeDI {
  Future<void> init() async {
    /// UseCases
    hsl.registerLazySingleton(() =>
        GetAllArticlesUseCase(articlesRepository: hsl()));

    /// Repositories
    hsl.registerLazySingleton<BaseArticlesRepository>(
            () =>
            ArticlesRepository(
                articlesDataSource: hsl()));

    /// DataSources
    hsl.registerLazySingleton<BaseArticlesRemoteDataSource>(
            () => ArticlesRemoteDataSource());
  }
}