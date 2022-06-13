import 'package:dio/dio.dart';

import 'LoggingInterceptor.dart';


const apiBaseUrl = "https://mocki.io/v1/";

class ApiClient {
  static const int connectTimeOut = 50000;
  static const int receiveTimeOut = 50000;
  static Dio? client;

  static Dio? getInstance() {
    if (client == null) {
      client = Dio();
      client?.options.baseUrl = apiBaseUrl;
      client?.options.connectTimeout = connectTimeOut;
      client?.options.receiveTimeout = receiveTimeOut;
      client?.options.headers = {
        'Accept': 'application/json',
      };
      // client?.options.headers['Accept'] = 'application/json';
      client?.options.contentType = 'application/json';
      //client?.options.headers['Authorization'] = 'Bearer nxsxbudwg6yd2uq461x3iioe0a0i76zj';
      //client!.options.headers['Authorization'] = 'Bearer $customerToken';
      client?.options.followRedirects = false;
      client?.interceptors.add(LoggingInterceptor());
    }
    return client;
  }

  static invalidateClient() {
    client?.clear();
    client = null;
  }
}
