import 'package:course_app_edspert_id/presentation/bloc/exercise/exercise_bloc.dart';
import 'package:course_app_edspert_id/presentation/screen/course/exercise/exercise_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/course/widgets/card_exercise_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/course/widgets/empty_exercise_widget.dart';
import 'package:course_app_edspert_id/src/data/datasource/course_remote_datasource.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseListScreen extends StatelessWidget {
  final String courseId;
  final String courseTitle;
  const ExerciseListScreen(
      {super.key, required this.courseId, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(courseRemoteDataSource: CourseRemoteDataSource())
            ..add(GetExerciseListEvent(courseId: courseId),),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            courseTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: AppColors.bodyColor,
        body: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Pilih Paket Soal",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff444444),
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<ExerciseBloc, ExerciseState>(
                builder: (context, state) {
                  if (state is ExerciseFailed) {
                    return const EmptyExerciseWidget();
                  } else if (state is ExerciseSucess) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),
                      itemCount: state.exerciseResponse.data.length,
                      itemBuilder: (context, index) {
                        final exercise = state.exerciseResponse.data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CardExerciseWidget(
                            materiName: exercise.exerciseTitle,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseScreen(),
                                ),
                              );
                            },
                            image: exercise.icon, packet: '${exercise.jumlahDone} / ${exercise.jumlahSoal}',
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
