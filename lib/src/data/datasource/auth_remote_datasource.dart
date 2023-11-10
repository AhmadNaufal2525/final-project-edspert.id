import 'dart:developer';
import 'package:course_app_edspert_id/src/data/models/register_user_request_model.dart';
import 'package:course_app_edspert_id/src/data/models/user_response_model.dart';
import 'package:course_app_edspert_id/src/utils/constant.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  Future<UserResponseModel> getUserByEmail(String email) async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.getUserPath}';
      final result = await Dio().get(
        url,
        queryParameters: {
          'email': email,
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final userResponse = UserResponseModel.fromJson(result.data);
      log('Response Body: $result');
      return userResponse;
      
    } catch (e, stackTrace) {
      log(
        e.toString(),
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<UserResponseModel> register(RegisterUserRequestModel request) async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.signUpPath}';
      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
        data: request.toMap(),
        
      );
      final userResponse = UserResponseModel.fromJson(result.data);
      log('Response Body: $result');
      return userResponse;
      
    } catch (e, stackTrace) {
      log(
        e.toString(),
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<UserResponseModel> updateProfile(String email) async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.signUpPath}';
      final result = await Dio().get(
        url,
         queryParameters: {
          'email': email,
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final userResponse = UserResponseModel.fromJson(result.data);
      log('Response Body: $result');
      return userResponse;
      
    } catch (e, stackTrace) {
      log(
        e.toString(),
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
