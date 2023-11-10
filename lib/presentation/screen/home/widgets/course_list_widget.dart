import 'package:course_app_edspert_id/presentation/screen/course/exercise_list/exercise_list_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/card_course_widget.dart';
import 'package:course_app_edspert_id/src/data/models/course_response_model.dart';
import 'package:flutter/material.dart';


class CourseListWidget extends StatelessWidget {
  final List<CourseDataModel> courseList;
  final bool isHomeScreen;
  const CourseListWidget(
      {super.key, required this.isHomeScreen, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: isHomeScreen ? 3 : courseList.length,
      physics: isHomeScreen
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemBuilder: (BuildContext context, int index) {
        final course = courseList[index];
        return CardCourseWidget(
          image: course.urlCover,
          courseName: course.courseName,
          coursePacket:
              '${course.jumlahDone} / ${course.jumlahMateri} Paket latihan soal',
          value: 0.5,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseListScreen(
                  courseId: course.courseId,
                  courseTitle: course.courseName,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
