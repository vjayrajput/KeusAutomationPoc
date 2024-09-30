import '../constants/strings.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = Strings.networkErrorOccurred]);
}
