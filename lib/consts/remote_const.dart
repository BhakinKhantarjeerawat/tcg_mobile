import 'package:dio/dio.dart';

const baseUrl1 = 'https://fakestoreapi.com/';
const baseUrl2 = 'https://fakestoreapi.com/products/2';

final getBaseOption = BaseOptions(
    // baseUrl: baseUrl1,
    connectTimeout: const Duration(seconds: 6),
    receiveTimeout: const Duration(seconds: 6),
    responseType: ResponseType.json);




