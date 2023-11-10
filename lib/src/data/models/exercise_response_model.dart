import 'dart:convert';

ExerciseResponseModel exercisesResponseFromJson(String str) => ExerciseResponseModel.fromJson(json.decode(str));

String exercisesResponseToJson(ExerciseResponseModel data) => json.encode(data.toJson());

class ExerciseResponseModel {
    int status;
    String message;
    List<ExerciseDataModel> data;

    ExerciseResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ExerciseResponseModel.fromJson(Map<String, dynamic> json) => ExerciseResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<ExerciseDataModel>.from(json["data"].map((x) => ExerciseDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ExerciseDataModel {
    String exerciseId;
    String exerciseTitle;
    String accessType;
    String icon;
    String exerciseUserStatus;
    String jumlahSoal;
    int jumlahDone;

    ExerciseDataModel({
        required this.exerciseId,
        required this.exerciseTitle,
        required this.accessType,
        required this.icon,
        required this.exerciseUserStatus,
        required this.jumlahSoal,
        required this.jumlahDone,
    });

    factory ExerciseDataModel.fromJson(Map<String, dynamic> json) => ExerciseDataModel(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
    };
}
