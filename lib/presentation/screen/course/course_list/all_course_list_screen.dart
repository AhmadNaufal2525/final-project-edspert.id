import 'package:course_app_edspert_id/presentation/screen/home/widgets/course_list_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/strings.dart';
import 'package:flutter/material.dart';

class AllCourseListScreen extends StatefulWidget {
  const AllCourseListScreen({super.key});

  @override
  State<AllCourseListScreen> createState() => _AllCourseListScreenState();
}

class _AllCourseListScreenState extends State<AllCourseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.pilihPelajaran,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.bodyColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 12),
        child: CourseListWidget(
          isHomeScreen: false,
        ),
      ),
    );
  }
}