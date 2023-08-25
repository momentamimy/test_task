import 'package:flutter/material.dart';
import 'package:test_task/core/usecase/usecase.dart';
import 'package:test_task/core/network_helper/exceptions.dart';
import 'package:test_task/core/utils/app_constants.dart';
import 'package:test_task/modules/home/domain/entities/article.dart';
import 'package:test_task/modules/home/domain/usecase/articles_usecase.dart';

class HomeProvider extends ChangeNotifier {
  final GetAllArticlesUseCase _articlesUseCase;

  final articlesList = <Article>[];
  int _status = AppConstants.idleStatus;

  int get status => _status;

  set status(int value) {
    _status = value;
    notifyListeners();
  }
  String onErrorMessage = "";

  HomeProvider({required articlesUseCase}) : _articlesUseCase = articlesUseCase;


  getAllArticles() async {
    try {
      status = AppConstants.loadingStatus;
      articlesList.clear();
      final result = await _articlesUseCase.call(const NoParams());
      articlesList.addAll(result);
      status = AppConstants.doneStatus;
    } on ServerException catch (e) {
      status = AppConstants.errorStatus;
      onErrorMessage = e.errorMessage;
    }catch(e){
      status = AppConstants.errorStatus;
      onErrorMessage = "Error occurred while communication with Server";
    }
  }
}
