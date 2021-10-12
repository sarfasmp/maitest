import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maitexatest/apiModel/userListModel.dart';

class UserListProvider extends ChangeNotifier {
  UserListModel? _userListModel;
  UserListModel? get userListModel => _userListModel;

  Dio dio = Dio();
  Response? response;

  Future<List<UserListDetailsModel>?> fetchUserDetails({
  int? pageNumber
  }) async {

    final params = {
      "page": pageNumber.toString(),
    };
    try {
      response = await dio.get(
        'https://reqres.in/api/users',
        queryParameters: params,

      );
      _userListModel = UserListModel.fromJson(response!.data);
      print("User details ");
      print(response!.data);

      return _userListModel!.data;
    } on DioError catch (e) {
      print("error from User details");
      //print(e);
    }
  }
}
