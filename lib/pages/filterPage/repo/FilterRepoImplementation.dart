import 'package:code95/Service/ApiClient.dart';
import 'package:code95/Service/HttpService.dart';
import 'package:code95/Service/HttpServiceImpl.dart';
import 'package:code95/config/RemoteConstant.dart';
import 'package:code95/pages/filterPage/model/FilterResonse.dart';
import 'package:code95/pages/filterPage/repo/FilterRepository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class FilterRepoImplementation extends FilterRepository {
  HttpService? _httpService;

  FilterRepoImplementation() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<FilterResponse> getAllUsers() async{
    try {
      final response = await _httpService?.getData(/*apiBaseUrl+*/Constant.HOMEPAGE);
      final parsedResponse = FilterResponse.fromJson(response?.data);
      return parsedResponse;
    } on Exception catch (e) {
      EasyLoading.showError(e.toString());
      return FilterResponse();
    }
  }
}