import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternet {
  Future<int> checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      return 0;
    } else if (result.contains(ConnectivityResult.mobile)) {
      return 1;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return 1;
    } else {
      return 0;
    }
  }
}
