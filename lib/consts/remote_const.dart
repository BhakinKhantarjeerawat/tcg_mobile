import 'package:dio/dio.dart';

const homeUrl = 'https://mytcg.net/api/get/user/find/31';


final getBaseOption = BaseOptions(
    // baseUrl: homeUrl,
    connectTimeout: const Duration(seconds: 6),
    receiveTimeout: const Duration(seconds: 6),
    responseType: ResponseType.json);




