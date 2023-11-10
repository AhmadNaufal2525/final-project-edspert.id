import 'dart:developer';
import 'package:course_app_edspert_id/src/data/models/banner_response_model.dart';
import 'package:course_app_edspert_id/src/utils/constant.dart';
import 'package:dio/dio.dart';

class BannerRemoteDataSource {
  Future<BannerResponseModel> getBanner() async {
    try {
      final url = '${APIUrl.baseUrl}${APIUrl.eventBanner}';
      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final bannerResponse = BannerResponseModel.fromJson(result.data);
      log('Response Body: $result');
      return bannerResponse;
      
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
