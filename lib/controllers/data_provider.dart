import 'package:assessment/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider extends ChangeNotifier {
  String? token;
  String? message;
  String? status;
  ApiService service = ApiService();
  userLogin({required String username, required String password}) async {
    Response response =
        await service.userLogin(username: username, password: password);
    token = response.data["data"];
    message = response.data["message"];
    status = response.data["status"];
    notifyListeners();
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    token = "";
    notifyListeners();
  }

  fetchData() {
    return service.fetchData(authtoken: token!);
  }
}
