import 'dart:convert';

CourseResponseModel courseResponseFromJson(String str) => CourseResponseModel.fromJson(json.decode(str));

String courseResponseToJson(CourseResponseModel data) => json.encode(data.toJson());

class CourseResponseModel {
    int status;
    String message;
    List<CourseDataModel> data;

    CourseResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory CourseResponseModel.fromJson(Map<String, dynamic> json) => CourseResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<CourseDataModel>.from(json["data"].map((x) => CourseDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CourseDataModel {
    String courseId;
    String majorName;
    String courseCategory;
    String courseName;
    String urlCover;
    int jumlahMateri;
    int jumlahDone;
    int progress;

    CourseDataModel({
        required this.courseId,
        required this.majorName,
        required this.courseCategory,
        required this.courseName,
        required this.urlCover,
        required this.jumlahMateri,
        required this.jumlahDone,
        required this.progress,
    });

    factory CourseDataModel.fromJson(Map<String, dynamic> json) => CourseDataModel(
        courseId: json["course_id"],
        majorName: json["major_name"],
        courseCategory: json["course_category"],
        courseName: json["course_name"],
        urlCover: json["url_cover"],
        jumlahMateri: json["jumlah_materi"],
        jumlahDone: json["jumlah_done"],
        progress: json["progress"],
    );

    Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "major_name": majorName,
        "course_category": courseCategory,
        "course_name": courseName,
        "url_cover": urlCover,
        "jumlah_materi": jumlahMateri,
        "jumlah_done": jumlahDone,
        "progress": progress,
    };
}
