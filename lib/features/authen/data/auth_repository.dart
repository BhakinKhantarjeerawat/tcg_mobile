import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_tcg_mobile/consts/remote_const.dart';
import 'package:my_tcg_mobile/network/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
Future<String> fetchHome(FetchHomeRef ref) async {
  final dio = ref.watch(dioProvider);
  // print(" before Debug:");

  // final dio = Dio();
  final response =
      await dio.get('https://mytcg.net/api/get/user/find/31');
  debugPrint(response.data.toString());
  return response.data.toString();
}
