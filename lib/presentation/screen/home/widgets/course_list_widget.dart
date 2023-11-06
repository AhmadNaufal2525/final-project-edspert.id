import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/card_course_widget.dart';
import 'package:flutter/material.dart';


class CourseListWidget extends StatelessWidget {
   final List<Map<String, dynamic>> courseList = [
    {
      'urlCover': 'assets/images/matematika.png',
      'courseName': 'Matematika',
      'jumlahDone': 0,
      'jumlahMateri': 10,
    },
    {
      'urlCover': 'assets/images/matematika.png',
      'courseName': 'Matematika',
      'jumlahDone': 0,
      'jumlahMateri': 10,
    },
    {
      'urlCover': 'assets/images/matematika.png',
      'courseName': 'Matematika',
      'jumlahDone': 0,
      'jumlahMateri': 10,
    }
  ];
  final bool isHomeScreen;
  CourseListWidget(
      {super.key, required this.isHomeScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
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
              image: course['urlCover'],
              courseName: course['courseName'],
              coursePacket:
                  '${course['jumlahDone']} / ${course['jumlahMateri']} Paket latihan soal',
              value: 0.5,
              onTap: () {
                Navigator.of(context).pushNamed(Routes.exerciseListScreen);
              },
            );
          },
        ),
      ],
    );
  }
}
