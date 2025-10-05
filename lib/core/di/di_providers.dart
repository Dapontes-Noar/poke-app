import 'package:dio/dio.dart';
import 'package:poke_app/core/network/api_constants.dart';
import 'package:poke_app/core/network/dio_client.dart';
import 'package:poke_app/core/network/interceptors/logger_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di_providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) => Dio(
  BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: ApiConstants.connectTimeout,
    receiveTimeout: ApiConstants.receiveTimeout,
    headers: ApiConstants.defaultHeaders,
    responseType: ResponseType.json,
  ),
)..interceptors.add(LoggerInterceptor());

@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return DioClient(dioInstance);
}
