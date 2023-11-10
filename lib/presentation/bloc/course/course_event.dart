part of 'course_bloc.dart';

abstract class CourseEvent {}

class GetCourseListEvent extends CourseEvent {
  final String majorName;
  GetCourseListEvent({required this.majorName});
}
