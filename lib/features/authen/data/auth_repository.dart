import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_tcg_mobile/exceptions/app_exception.dart';
import 'package:my_tcg_mobile/network/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.dio});
  final Dio dio;

  Future<void> emailSignIn({required email, required password}) async {
    if (email.length < 1 || password.length < 1) {
      throw EmptyEmailOrPasswordException();
    }
    try {
      final response = await dio.post('login',
          //   queryParameters: {
          //   'api_key': apiKey,
          // },
          data: {"email": email, "password": password});
      debugPrint(response.data["token"]);
      // SecureStorage.saveToken(response.data['token']);
    } on DioException catch (e) {
      throw e.response?.data["message"] ?? "ERROR: Unknown Dio Error";
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {}

}

/// only for signin
@riverpod
AuthRepository authRepositoryNoToken(AuthRepositoryNoTokenRef ref) {
  return AuthRepository(dio: ref.watch(dioNoTokenProvider));
}
