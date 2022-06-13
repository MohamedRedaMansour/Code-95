import 'package:code95/pages/filterPage/viewModel/FilterViewModel.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterViewModel());
  }

}