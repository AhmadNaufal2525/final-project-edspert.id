import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/banner_list_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/course_list_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai, Altop',
                          style: TextStyle(
                            color: AppColors.titleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Selamat Datang',
                          style: TextStyle(color: AppColors.titleColor),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.profileScreen);
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 147,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Mau kerjain\nlatihan soal\napa hari ini?',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/images/ilustrator.png',
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.pilihPelajaran,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Routes.listAllCourseScreen);
                      },
                      child: Text(
                        'Lihat semua',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CourseListWidget(isHomeScreen: true),
                const SizedBox(
                  height: 20,
                ),
                BannerListWidget(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.diskusiScreen);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
