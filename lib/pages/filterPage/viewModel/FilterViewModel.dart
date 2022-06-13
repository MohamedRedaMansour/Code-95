
import 'package:code95/di/binding.dart';
import 'package:code95/pages/filterPage/model/FilterResonse.dart';
import 'package:code95/pages/filterPage/repo/FilterRepoImplementation.dart';
import 'package:code95/pages/filterPage/repo/FilterRepository.dart';
import 'package:code95/pages/filterPage/view/ResultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class FilterViewModel extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FilterRepository? filterRepository;
  List<People>? usersList ;
  bool showMore = false;

  List<String> list = ['First Name', 'Last Name'];
  String dropdownValue = 'First Name';

  List<String> equalList = ['=', '!='];
  String dropdownEqualNAme = '=';

  List<String> andOrList = ['AND', 'OR'];
  String dropdownAndOr = 'AND';

  List<String> genderList = ['Male', 'Female'];
  String dropdownGender = 'Male';

  List<String> equalListGender = ['=', '!='];
  String dropdownEqualGender = '=';

  bool firstTextFieldValidated = false;
  bool secondTextFieldValidated = false;

  String firstValue = '';
  String secondValue = '';


  FilterViewModel() {
    filterRepository = Get.put(FilterRepoImplementation());
  }

  validateData(){
    formKey.currentState!.save();
    if(formKey.currentState!.validate()){
      getAllData();
    }else{
    }
  }


  getAllData() async {
    final result = filterRepository?.getAllUsers();
    if (result != null) {
      Get.to(() => const ResultScreen(), binding: Binding());
      result.then((value) {
        usersList = value.people!;
        if (dropdownEqualNAme == '=') {
          if (dropdownValue == list[0]) {
            value.people = value.people
                ?.where((x) => x.firstName!
                    .toLowerCase()
                    .contains(firstValue.toLowerCase()))
                .toList();
          } else {
            value.people = value.people
                ?.where((x) => x.lastName!
                    .toLowerCase()
                    .contains(firstValue.toLowerCase()))
                .toList();
          }
        } else {
          if (dropdownValue == list[0]) {
            value.people = value.people
                ?.where((x) => !(x.firstName!
                    .toLowerCase()
                    .contains(firstValue.toLowerCase())))
                .toList();
          } else {
            value.people= value.people
                ?.where((x) => !(x.lastName!
                    .toLowerCase()
                    .contains(firstValue.toLowerCase())))
                .toList();
          }
        }
        if (showMore == true) {
          if(dropdownAndOr == andOrList[0]) {
            if (dropdownEqualGender == '=') {
              value.people = value.people
                  ?.where((x) =>
              x.gender!
                  .toLowerCase()
                  == (dropdownGender.toLowerCase()))
                  .toList();
            } else {
              value.people = value.people
                  ?.where((x) =>
              !(x.gender!
                  .toLowerCase() ==
                  (dropdownGender.toLowerCase())))
                  .toList();
            }
          }else{
            if (dropdownEqualGender == '=') {
              usersList = usersList
                  ?.where((x) =>
              x.gender!
                  .toLowerCase()
                  == (dropdownGender.toLowerCase()))
                  .toList();
              value.people?.addAll(usersList!);
            } else {
              usersList = usersList
                  ?.where((x) =>
              !(x.gender!
                  .toLowerCase()
                  ==
                  (dropdownGender.toLowerCase())))
                  .toList();
              value.people?.addAll(usersList!);
            }
          }
        }else{
          usersList = value.people!;
        }
        usersList = value.people!;
        update();
      });
    } else {
      EasyLoading.showError('Error}');
    }
    update();
  }
}