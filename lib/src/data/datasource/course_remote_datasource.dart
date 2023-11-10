import 'dart:convert';
import 'dart:developer';
import 'package:course_app_edspert_id/src/data/models/course_response_model.dart';
import 'package:course_app_edspert_id/src/data/models/exercise_response_model.dart';
import 'package:course_app_edspert_id/src/data/models/question_list_response_model.dart';
import 'package:course_app_edspert_id/src/utils/constant.dart';
import 'package:dio/dio.dart';


class CourseRemoteDataSource {
  Future<CourseResponseModel> getCourse(String majorName) async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.coursePath}';
      final result = await Dio().get(
        url,
        queryParameters: {
          'major_name': majorName,
          'user_email': 'testerngbayu@gmail.com',
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final courseResponse =  CourseResponseModel.fromJson(result.data);
      log('Response Body: $result');
      return courseResponse;
      
    } catch (e, stackTrace) {
      log(
        e.toString(),
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
  Future<ExerciseResponseModel> getExercise(String courseId) async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.exercisesPath}';
      
      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
        queryParameters: {
          'course_id': courseId,
          'user_email' : 'testerngbayu@gmail.com'
        }
      );
      
      final exercisesResponse =  ExerciseResponseModel.fromJson(result.data);
      log('Response Body: $result');
      return exercisesResponse;
      
    } catch (e, stackTrace) {
      log(
        e.toString(),
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<QuestionResponseModel> getQuestionList(String exerciseId) async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.questionsPath}';
      final result = await Dio().post(
        url,
        data: {
          'exercise_id': exerciseId,
          'user_email': 'testerngbayu@gmail.com',
        },
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      
      final questionResponse = QuestionResponseModel.fromJson(result.data);

      log('Resultnya $exerciseId : ${json.encode(result.data)}');
      return questionResponse;

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
