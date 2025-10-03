import 'package:dio/dio.dart';
import 'package:poke_app/core/network/api_constants.dart';
import 'package:poke_app/core/network/dio_client.dart';
import 'package:poke_app/core/network/interceptors/logger_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di_providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: ApiConstants.defaultHeaders,
      responseType: ResponseType.json,
    ),
  )..interceptors.add(LoggerInterceptor());
}

@riverpod
DioClient dioClient(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return DioClient(dioInstance);
}
