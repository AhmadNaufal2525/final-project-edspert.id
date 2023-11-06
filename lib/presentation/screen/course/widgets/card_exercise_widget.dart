import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';

class CardExerciseWidget extends StatelessWidget {
  final String image;
  final String materiName;
  final String packet;
  final Function() onTap;
  const CardExerciseWidget(
      {super.key,
      required this.materiName,
      required this.packet,
      required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 96,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xffF3F7F8),
              ),
              child: Image.network(
                image,
                width: 14.94,
                height: 14,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  'assets/icons/materi.png',
                  height: 14.94,
                  width: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                materiName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              packet,
              style: const TextStyle(
                color: Color(0xff8E8E8E),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
