// ignore_for_file: override_on_non_overriding_member


import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'ApiClient.dart';
import 'HttpService.dart';



class HttpServiceImpl implements HttpService {
  final dio = ApiClient.getInstance();

  @override
  Future<Response> postRequest(String url, Map map) async {
    Response response;
    final  dio = ApiClient.getInstance();
    try {
       response = await dio!.post(url, data: map);
    } on DioError catch (e) {
      EasyLoading.dismiss();
      //validationNavigation(e.response?.statusCode);
      throw  e.message;
    }
    return response;
  }

  @override
  Future<Response> getData(String url) async {
    Response response;
   final  dio = ApiClient.getInstance();

    try {
      response = await dio!.get(url);
      return response;
    } on DioError catch (e) {
      EasyLoading.dismiss();
      //validationNavigation(e.response?.statusCode);
      throw Exception(e.message);
    }
  }

  // validationNavigation(int? statusCode) {
  //   // 500 => server down or issue in backEnd
  //   // null => network fail
  //   if (statusCode == null) {
  //     Get.to(() => EmptyListView(
  //       backIcone: Container(),
  //       isShowBottomBar: false,
  //           title: Constants.NETWORK_FAILURE.tr,
  //           imageName: "assets/images/internetDown.png",
  //           descValue: Constants.NETWORK_FAILURE_BODY.tr,
  //           emptyTitle: Constants.NETWORK_FAILURE.tr,
  //           btnTitle: null,
  //           isShowBtn: false,
  //         ));
  //     return;
  //   } else if(statusCode == 500) {
  //     Get.to(() => EmptyListView(
  //       backIcone: Container(),
  //       isShowBottomBar: false,
  //       indexNum: 3,
  //           title: Constants.SERVER_ERROR_TITLE.tr,
  //           imageName: "assets/images/serverDown.png",
  //           descValue: Constants.SERVER_ERROR_BODY.tr,
  //           emptyTitle: Constants.SERVER_ERROR_TITLE.tr,
  //           btnTitle: null,
  //           isShowBtn: false,
  //         ));
  //     return;
  //   }
  // }
}
