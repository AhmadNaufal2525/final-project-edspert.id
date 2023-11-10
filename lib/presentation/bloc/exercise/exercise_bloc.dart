import 'package:course_app_edspert_id/src/data/datasource/course_remote_datasource.dart';
import 'package:course_app_edspert_id/src/data/models/exercise_response_model.dart';
import 'package:course_app_edspert_id/src/data/models/question_list_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final CourseRemoteDataSource courseRemoteDataSource;
  ExerciseBloc({required this.courseRemoteDataSource}) : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is GetExerciseListEvent) {
        emit(ExerciseLoading());
        final result = await courseRemoteDataSource.getExercise(event.courseId);
        emit(
          ExerciseSucess(
            exerciseResponse: result,
          ),
        );
      }
      if (event is GetExercisesByCourseEvent) {
        emit(ExerciseQuestionLoading());
        final result =
            await courseRemoteDataSource.getQuestionList(event.exerciseId);
        emit(
          ExerciseQuestionSucess(questionResponseModel: result),
        );
      }
    });
  }
}
