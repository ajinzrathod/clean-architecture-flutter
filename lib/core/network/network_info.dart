import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    ConnectivityResult connectivityResult = await connectivity.checkConnectivity();
    if(connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
      return Future.value(true);
    }
    return Future.value(false);
  }
}