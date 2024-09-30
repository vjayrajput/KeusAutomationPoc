import '../constants/strings.dart';

class ServerException implements Exception {
  final String message;

  ServerException([this.message = Strings.serverErrorOccurred]);
}
