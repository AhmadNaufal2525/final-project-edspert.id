import 'dart:convert';

QuestionResponseModel questionResponseModelFromJson(String str) => QuestionResponseModel.fromJson(json.decode(str));

String questionResponseModelToJson(QuestionResponseModel data) => json.encode(data.toJson());

class QuestionResponseModel {
    int status;
    String message;
    List<QuestionDataModel> data;

    QuestionResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory QuestionResponseModel.fromJson(Map<String, dynamic> json) => QuestionResponseModel(
        status: json["status"],
        message: json["message"],
        data: List<QuestionDataModel>.from(json["data"].map((x) => QuestionDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class QuestionDataModel {
    String exerciseIdFk;
    String bankQuestionId;
    String questionTitle;
    dynamic questionTitleImg;
    String optionA;
    dynamic optionAImg;
    String optionB;
    dynamic optionBImg;
    String optionC;
    dynamic optionCImg;
    String optionD;
    dynamic optionDImg;
    String optionE;
    dynamic optionEImg;
    StudentAnswer studentAnswer;

    QuestionDataModel({
        required this.exerciseIdFk,
        required this.bankQuestionId,
        required this.questionTitle,
        required this.questionTitleImg,
        required this.optionA,
        required this.optionAImg,
        required this.optionB,
        required this.optionBImg,
        required this.optionC,
        required this.optionCImg,
        required this.optionD,
        required this.optionDImg,
        required this.optionE,
        required this.optionEImg,
        required this.studentAnswer,
    });

    factory QuestionDataModel.fromJson(Map<String, dynamic> json) => QuestionDataModel(
        exerciseIdFk: json["exercise_id_fk"],
        bankQuestionId: json["bank_question_id"],
        questionTitle: json["question_title"],
        questionTitleImg: json["question_title_img"],
        optionA: json["option_a"],
        optionAImg: json["option_a_img"],
        optionB: json["option_b"],
        optionBImg: json["option_b_img"],
        optionC: json["option_c"],
        optionCImg: json["option_c_img"],
        optionD: json["option_d"],
        optionDImg: json["option_d_img"],
        optionE: json["option_e"],
        optionEImg: json["option_e_img"],
        studentAnswer: studentAnswerValues.map[json["student_answer"]]!,
    );

    Map<String, dynamic> toJson() => {
        "exercise_id_fk": exerciseIdFk,
        "bank_question_id": bankQuestionId,
        "question_title": questionTitle,
        "question_title_img": questionTitleImg,
        "option_a": optionA,
        "option_a_img": optionAImg,
        "option_b": optionB,
        "option_b_img": optionBImg,
        "option_c": optionC,
        "option_c_img": optionCImg,
        "option_d": optionD,
        "option_d_img": optionDImg,
        "option_e": optionE,
        "option_e_img": optionEImg,
        "student_answer": studentAnswerValues.reverse[studentAnswer],
    };
}

enum StudentAnswer {
    D
}

final studentAnswerValues = EnumValues({
    "D": StudentAnswer.D
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
