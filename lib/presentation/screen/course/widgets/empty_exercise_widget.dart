import 'package:flutter/material.dart';

class EmptyExerciseWidget extends StatelessWidget {
  const EmptyExerciseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
              height: 100,
            ),
          Image.asset('assets/empty_ilustrator.png'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Yah, Paket tidak tersedia',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff1A1F26),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Tenang, masih banyak yang bisa kamu pelajari. cari lagi yuk!',
            style: TextStyle(color: Color(0xff99A1AC), fontSize: 16),textAlign: TextAlign.center,
          )
        ],
      );
  }
}