import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckNetwork {
  Future<bool> get isConnected;
}

class NetworkCheckerImp implements CheckNetwork {
final InternetConnectionChecker internetConnectionChecker ;
  NetworkCheckerImp(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
