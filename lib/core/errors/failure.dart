import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerFailure('Connection timeout with the API server.');

    case DioExceptionType.sendTimeout:
      return ServerFailure('Send timeout while communicating with the API server.');

    case DioExceptionType.receiveTimeout:
      return ServerFailure('Receive timeout from the API server.');

    case DioExceptionType.badCertificate:
      return ServerFailure('The certificate from the server is invalid.');

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 0;
      final data = e.response?.data;
      return ServerFailure.fromResponse(statusCode, data);

    case DioExceptionType.cancel:
      return ServerFailure('Request to the API server was cancelled.');

    case DioExceptionType.connectionError:
      return ServerFailure('No Internet connection. Please check your network.');

    case DioExceptionType.unknown:
    return ServerFailure('Unexpected error occurred. Please try again later.');
  }
}


  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Unknown error occurred');
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
         
        return ServerFailure('Authentication error');
      case 404:
        return ServerFailure('Your request was not found, please try again later');
      case 500:
        return ServerFailure('Server error, please try again later');
      default:
        return ServerFailure('Unexpected error occurred. Please try again');
    }
  }
}



class CachFailure extends Failure {
  CachFailure(super.message);
}

class NetworkFailure extends Failure
{
  NetworkFailure(super.message);
  
}
