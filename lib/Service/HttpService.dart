import 'package:dio/dio.dart';

abstract class HttpService{
  Future<Response> postRequest(String url,Map map);
  Future<Response> getData(String url);
}