import 'package:covid_tracker/models/case_model.dart';
import 'package:covid_tracker/models/other_case_model.dart';
import 'package:dio/dio.dart';

import 'api_interceptor.dart';

class ApiClient {
  static const baseUrl =
      'https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0';
  Dio _dio;
  ApiClient() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000, connectTimeout: 100000, baseUrl: baseUrl);
    _dio = Dio(options);
    _dio.interceptors.add(ApiInterceptor());
  }
  Future<CaseModel> getAllCases() async {
    final url = '$baseUrl/cases';

    try {
      final response = await _dio.get(url);
      return CaseModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      print(e.error);
      throw e.error; 
    }
  }
  Future<OtherCaseModel> getSuspectedCases() async {
    final url = '$baseUrl/cases/suspected';

    try {
      final response = await _dio.get(url);
      return OtherCaseModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }
  Future<OtherCaseModel> getConfirmedCases() async {
    final url = '$baseUrl/cases/confirmed';

    try {
      final response = await _dio.get(url);
      return OtherCaseModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }
  Future<OtherCaseModel> getDeathCases() async {
    final url = '$baseUrl/deaths';

    try {
      final response = await _dio.get(url);
      return OtherCaseModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }
  Future<OtherCaseModel> getRecoveredCases() async {
    final url = '$baseUrl/recovered';

    try {
      final response = await _dio.get(url);
      return OtherCaseModel.fromJson(response.data[0]);
    } on DioError catch (e) {
      print(e.error);
      throw e.error;
    }
  }
}
