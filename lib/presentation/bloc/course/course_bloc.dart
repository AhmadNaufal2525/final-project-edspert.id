import 'package:course_app_edspert_id/src/data/datasource/course_remote_datasource.dart';
import 'package:course_app_edspert_id/src/data/models/course_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRemoteDataSource courseRemoteDataSource;
  CourseBloc({required this.courseRemoteDataSource}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseListEvent) {
        emit(CourseLoading());

        final result = await courseRemoteDataSource.getCourse(event.majorName);
        
        emit(CourseSucess(courseResponse: result));
      } 
    });
  }
}