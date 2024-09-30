import 'dart:io';

import '../constants/strings.dart';
import 'network_exception.dart';
import 'server_exception.dart';

class ErrorHandler {
  static String getErrorMessage(Object error) {
    if (error is NetworkException) {
      return error.message;
    } else if (error is ServerException) {
      return error.message;
    } else if (error is SocketException) {
      return Strings.noInternetConnectionPleaseTryAgain;
    } else if (error is HttpException) {
      return Strings.serverRespondedWithError;
    } else {
      return "An unexpected error occurred: ${error.toString()}";
    }
  }
}
