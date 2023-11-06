import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/presentation/screen/course/widgets/card_exercise_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';

class ExerciseListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exerciseList = [
    {
      'urlCover': 'assets/icons/materi.png',
      'courseName': 'Matriks',
      'jumlahDone': 0,
      'jumlahMateri': 10,
    },
    {
      'urlCover': 'assets/icons/materi.png',
      'courseName': 'Matriks',
      'jumlahDone': 0,
      'jumlahMateri': 10,
    },
    {
      'urlCover': 'assets/icons/materi.png',
      'courseName': 'Matriks',
      'jumlahDone': 0,
      'jumlahMateri': 10,
    }
  ];
  ExerciseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Matematika',
          style: TextStyle(fontWeight: FontWeight.bold),
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
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.6,
            ),
            itemCount: exerciseList.length,
            itemBuilder: (context, index) {
              final exercise = exerciseList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardExerciseWidget(
                  materiName: exercise['courseName'],
                  packet:
                      '${exercise['jumlahMateri']} / ${exercise['jumlahDone']}',
                  onTap: () {
                     Navigator.of(context).pushNamed(Routes.exerciseScreen);
                  },
                  image: exercise['urlCover'],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}