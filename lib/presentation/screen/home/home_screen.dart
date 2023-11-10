import 'package:course_app_edspert_id/presentation/bloc/banner/banner_bloc.dart';
import 'package:course_app_edspert_id/presentation/bloc/course/course_bloc.dart';
import 'package:course_app_edspert_id/presentation/screen/course/course_list/all_course_list_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/banner_list_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/course_list_widget.dart';
import 'package:course_app_edspert_id/src/data/datasource/banner_remote_datasource.dart';
import 'package:course_app_edspert_id/src/data/datasource/course_remote_datasource.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final courseBloc = CourseBloc(
    courseRemoteDataSource: CourseRemoteDataSource(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BannerBloc(
            bannerRemoteDataSource: BannerRemoteDataSource(),
          )..add(GetBannerListEvent()),
        ),
        BlocProvider(
          create: (context) =>
              courseBloc..add(GetCourseListEvent(majorName: 'IPA')),
        ),
      ],
      child: Scaffold(
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
                            'Hai, Ahmad',
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
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllCourseListScreen(
                                courseBloc: courseBloc,
                              ),
                            ),
                          );
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
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseFailed) {
                        return Center(
                          child: Text(state.message ?? ''),
                        );
                      } else if (state is CourseSucess) {
                        return CourseListWidget(
                          courseList: state.courseResponse.data,
                          isHomeScreen: true,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerFailed) {
                        return Center(
                          child: Text(state.message ?? ''),
                        );
                      } else if (state is BannerSuccess) {
                        return BannerListWidget(
                          bannerList: state.bannerResponse.data,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}
