import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckNetwork {
  Future<bool> get isConnected;
}

@LazySingleton(as: CheckNetwork)
class NetworkCheckerImp implements CheckNetwork {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkCheckerImp(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected =>
      internetConnectionChecker.hasConnection.timeout(Duration(seconds: 5));
}
