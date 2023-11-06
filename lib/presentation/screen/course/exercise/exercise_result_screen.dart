import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class ExerciseResultScreen extends StatefulWidget {
  const ExerciseResultScreen({super.key});

  @override
  State<ExerciseResultScreen> createState() => _ExerciseResultScreenState();
}

class _ExerciseResultScreenState extends State<ExerciseResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3A7FD5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                 Navigator.of(context).pushNamed(Routes.homeScreen);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              label: const Text(
                'Tutup',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Selamat',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Kamu telah menyelesaikan Kuiz ini',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/images/complete.png'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Nilai kamu:',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const Text(
                    '100',
                    style: TextStyle(color: Colors.white, fontSize: 96),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
