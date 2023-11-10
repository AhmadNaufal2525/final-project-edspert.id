part of 'exercise_bloc.dart';

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseSucess extends ExerciseState {
  final ExerciseResponseModel exerciseResponse;

  ExerciseSucess({required this.exerciseResponse});
}

final class ExerciseFailed extends ExerciseState {
  final String? message;

  ExerciseFailed({this.message});
}


final class ExerciseQuestionLoading extends ExerciseState {}

final class ExerciseQuestionSucess extends ExerciseState {
  final QuestionResponseModel questionResponseModel;

  ExerciseQuestionSucess({required this.questionResponseModel});
}

final class ExerciseQuestionFailed extends ExerciseState {
  final String? message;

  ExerciseQuestionFailed({this.message});
}

