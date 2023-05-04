import 'package:dio/dio.dart';
import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';

class CustomException implements Exception {
  final int status;
  final dynamic data;
  final String message;
  final ExceptionEnum error;

  const CustomException({
    required this.status,
    required this.error,
    required this.data,
    required this.message,
  });

  factory CustomException.unknown({
    required dynamic e,
  }) {
    return CustomException(
      status: 500,
      data: null,
      error: ExceptionEnum.internal,
      message: e.toString(),
    );
  }

  factory CustomException.dioException({
    required Response? res,
  }) {
    return CustomException(
      status: res?.statusCode ?? 500,
      data: res?.data,
      error: ExceptionEnum.request,
      message: res != null && res.data != null && res.data['message'] != null
          ? res.data['message']
          : res?.statusMessage ?? '',
    );
  }

  factory CustomException.exception({
    required dynamic e,
    required ExceptionEnum error,
  }) {
    return CustomException(
      status: 500,
      data: null,
      error: error,
      message: e.toString(),
    );
  }
}
