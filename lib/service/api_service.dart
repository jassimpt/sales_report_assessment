import 'package:assessment/model/data_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  static const apiUrl = "https://sales-report-backend.onrender.com/api/user/";

  Future<Response> userLogin(
      {required String username, required String password}) async {
    try {
      Response response = await dio.post("${apiUrl}login",
          data: {"username": username, "password": password});

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DataModel> fetchData({required String authtoken}) async {
    try {
      dio.options.headers['Authorization'] = "Bearer $authtoken";
      Response response = await dio.get("${apiUrl}dashboard");
      if (response.statusCode == 200) {
        DataModel data = DataModel.fromJson(response.data["data"]);
        return data;
      } else {
        throw Exception("fetch error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
