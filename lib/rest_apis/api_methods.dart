import 'package:connectivity_plus/connectivity_plus.dart';

class ApiMethods {
  static Future<bool> checkInternetConnectivity() async {
    List<ConnectivityResult> connectivityList = await Connectivity().checkConnectivity();
    return connectivityList.isNotEmpty &&
        connectivityList.any(
          (element) =>
              element == ConnectivityResult.mobile &&
              element == ConnectivityResult.wifi &&
              element == ConnectivityResult.ethernet,
        );
  }
}
