import 'package:dio/dio.dart';

class ServerException implements Exception{
  final String errorMessage;

  ServerException({required this.errorMessage});
}

class ResponseStatusExceptions{

  static Response handleResponseStatus(Response? response){
    if(response == null)  throw ServerException(errorMessage: 'No Internet Connection');
    switch (response.statusCode) {
      case 200:
        return response;

      case 201:
        return response;
      default:
        throw ServerException(errorMessage: 'Error occurred while communication with Server');
    }
  }

}