import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';

class BannerListWidget extends StatelessWidget {
  final List<String> bannerList = [
    'assets/images/information.png',
    'assets/images/information.png',
    'assets/images/information.png',
  ];
  BannerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terbaru',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              final banner = bannerList[index];
              return Container(
                width: 340,
                margin: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    Image.asset(banner, width: 340),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
