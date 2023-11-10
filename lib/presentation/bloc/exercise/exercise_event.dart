part of 'exercise_bloc.dart';

abstract class ExerciseEvent {}

class GetExerciseListEvent extends ExerciseEvent {
  final String courseId;

  GetExerciseListEvent({required this.courseId});
}

class GetExercisesByCourseEvent extends ExerciseEvent {
  final String exerciseId;

  GetExercisesByCourseEvent({required this.exerciseId});
}

