import 'package:code95/pages/filterPage/model/FilterResonse.dart';

abstract class FilterRepository{
  Future<FilterResponse> getAllUsers();
}