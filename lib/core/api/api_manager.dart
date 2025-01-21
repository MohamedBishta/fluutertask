
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants.dart';

@singleton
class ApiManager{
  static late Dio dio;
  static void init(){
    dio = Dio(
      BaseOptions(baseUrl: Constants.baseUrl)
    );
  }

  Future<Response> getRequest({required String endpoint,Map<String ,dynamic>? queryParameters}) async {
    var response = await dio.get(endpoint,queryParameters: queryParameters);
    return response;
  }
  Future<Response> postRequest({required String endpoint ,Map<String ,dynamic>? body}) async{
    var response = await dio.post(endpoint,data: body);
    return response;
  }
}