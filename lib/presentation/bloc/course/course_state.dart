part of 'course_bloc.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSucess extends CourseState {
  final CourseResponseModel courseResponse;

  CourseSucess({required this.courseResponse});
}

final class CourseFailed extends CourseState {
  final String? message;

  CourseFailed({this.message});
}
