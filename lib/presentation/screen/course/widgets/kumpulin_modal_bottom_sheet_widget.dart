import 'package:flutter/material.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';

class KumpulinModalBottomSheet extends StatelessWidget {
  final VoidCallback onNantiDuluPressed;
  final VoidCallback onYaPressed;

  const KumpulinModalBottomSheet({
    Key? key,
    required this.onNantiDuluPressed,
    required this.onYaPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            height: 20,
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: onNantiDuluPressed,
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
                onPressed: onYaPressed,
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
  }
}
