import 'package:flutter/material.dart';
import 'package:my_tcg_mobile/network/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
Future<String> fetchHome(FetchHomeRef ref) async {
  final dio = ref.watch(dioProvider);
  final response =
      await dio.get('https://mytcg.net/api/get/user/find/31');
  // debugPrint(response.data.toString());
  return response.data.toString();
}

@riverpod
Future<String> fetchUserData(FetchHomeRef ref,{required String id}) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('https://mytcg.net/api/create/record/forgood/$id');
  return response.data.toString();
}


//TODO: might be deleted
@riverpod
Future<String> login(LoginRef ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.post('https://reqres.in/api/users',data:{
    "name": "morpheus",
    "job": "leader"
  });
  debugPrint(response.data.toString());
  return response.data.toString();
}
