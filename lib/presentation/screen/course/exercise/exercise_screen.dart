import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/presentation/screen/course/widgets/answer_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/course/widgets/quiz_number_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int currentQuestion = 0;
  bool isKumpulin = false;

  List<bool> selectedAnswers = [false, false, false, false, false];
  void handleAnswerTap(int index) {
    setState(() {
      for (int i = 0; i < selectedAnswers.length; i++) {
        selectedAnswers[i] = i == index;
      }
    });
  }

  void showKumpulinModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/done_ilustrator.png',
                width: 360,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Kumpulkan latihan soal sekarang?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Boleh langsung kumpulin dong',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9C9C9C),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          isKumpulin = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            width: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      child: Text(
                        'Nanti Dulu',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.resultScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(120, 50),
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none,
                      ),
                    ),
                    child: Text(
                      'Ya',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void goToNextQuestion() {
    if (currentQuestion < 10) {
      setState(() {
        currentQuestion++;
      });
    } else if (currentQuestion == 10) {
      setState(() {
        isKumpulin = true;
      });
      showKumpulinModalBottomSheet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Latihan Soal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: AppColors.whiteColor,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                     10,
                      (index) {
                        return QuizNumber(
                          number: (index + 1).toString(),
                          isSelected: index + 1 <= currentQuestion,
                          isKumpulin: isKumpulin,
                        );
                      },
                    ),
                ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Soal Nomor ${currentQuestion + 1}',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.titleColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: SizedBox(width: 40.0),
                          ),
                          TextSpan(
                            text:
                                "Yogyakarta is one of the foremost cultural centers of Java, the seat of the mighty Javanese empire of Mataram from which present day Yogyakarta has the best inherited of traditions. The city itself has a special charm, which seldom fails to captivate the visitor. Gamelan, classical and contemporary Javanese dances, leather puppet, theater and other expressions of traditional art will keep the visitor spellbound. Local craftsmen excel in arts such batiks, silver and leather works. Next to the traditional, contemporary art has found fertile soil in Yogya's culture oriented society.'",
                            style: TextStyle(
                                color: AppColors.titleColor,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Answer(
                      alphabet: 'A',
                      answer: 'To amuse the readers with Yogyakarta',
                      isSelected: selectedAnswers[0],
                      onTap: () => handleAnswerTap(0),
                    ),
                    Answer(
                      alphabet: 'B',
                      answer: 'To describe the location of Yogyakarta',
                      isSelected: selectedAnswers[1],
                      onTap: () => handleAnswerTap(1),
                    ),
                    Answer(
                      alphabet: 'C',
                      answer: 'To persuade the readers to go to Yogyakarta',
                      isSelected: selectedAnswers[2],
                      onTap: () => handleAnswerTap(2),
                    ),
                    Answer(
                      alphabet: 'D',
                      answer: 'To promote Yogyakarta as tourist destination',
                      isSelected: selectedAnswers[3],
                      onTap: () => handleAnswerTap(3),
                    ),
                    Answer(
                      alphabet: 'E',
                      answer: 'To tell the readers the history of Yogyakarta',
                      isSelected: selectedAnswers[4],
                      onTap: () => handleAnswerTap(4),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          goToNextQuestion();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(140, 50),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide.none,
                          ),
                        ),
                        child: Text(
                          currentQuestion == 10 ? 'Kumpulin' : 'Selanjutnya',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
