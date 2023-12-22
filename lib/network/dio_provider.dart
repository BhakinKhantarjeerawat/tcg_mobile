
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_tcg_mobile/network/loger_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dioNoToken(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(LoggerInterceptor());
  return Dio(
    BaseOptions(
        // baseUrl: Env.baseUrl,
        baseUrl: "https://api.ata-payroll.com/api/",
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        responseType: ResponseType.json,
        queryParameters: {
          // 'api_key': Env.apiKey,
        }),
  );
}

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  // const storage = FlutterSecureStorage();
  // final token = ref.watch(getSecureTokenProvider).value;
  // String tokenWithBearer = "Bearer ${token!}";
  // if (tokenWithBearer == null) {
  //   debugPrint("TOKEN BEARER IS NULL!");
  // }
  debugPrint("TOKEN:");
  // debugPrint(token.toString());
  dio.interceptors.add(LoggerInterceptor());
  return Dio(
    BaseOptions(
        baseUrl: "https://api.ata-payroll.com/api/",
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        queryParameters: {
          // 'api_key': Env.tmdbKey,
        },
        responseType: ResponseType.json,
        headers: {
          "Content-Type": "application/json",
          //TODO: tokenWithBearer
          "Authorization": "tokenWithBearer"
        }),
  );
}

/// incase issues on repository (different API Content-Type)
@riverpod
Dio dioPatch(DioRef ref) {
  final dio = Dio();
  // const storage = FlutterSecureStorage();
  // final token = ref.watch(getSecureTokenProvider).value;
  // String tokenWithBearer = "Bearer ${token!}";
  // if (tokenWithBearer == null) {
  //   debugPrint("TOKEN BEARER IS NULL!");
  // }
  debugPrint("TOKEN:");
  // debugPrint(token.toString());
  dio.interceptors.add(LoggerInterceptor());
  return Dio(
    BaseOptions(
        baseUrl: "https://api.ata-payroll.com/api/",
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        queryParameters: {
          // 'api_key': Env.tmdbKey,
        },
        responseType: ResponseType.json,
        headers: {
          "Content-Type": "application/merge-patch+json",
          //TODO: tokenWithBearer
          "Authorization": "tokenWithBearer"
        }),
  );
}
