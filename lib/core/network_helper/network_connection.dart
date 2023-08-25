import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test_task/core/network_helper/exceptions.dart';

class NetworkConnection{
  static check() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw ServerException(errorMessage: 'No Internet Connection');
    }
  }
}