import 'package:course_app_edspert_id/presentation/bloc/course/course_bloc.dart';
import 'package:course_app_edspert_id/presentation/screen/home/widgets/course_list_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCourseListScreen extends StatelessWidget {
  final CourseBloc courseBloc;
  const AllCourseListScreen({super.key, required this.courseBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: courseBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.pilihPelajaran,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        backgroundColor: AppColors.bodyColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, top: 12),
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseFailed) {
                return Center(
                  child: Text(state.message ?? ''),
                );
              } else if (state is CourseSucess) {
                return CourseListWidget(
                  isHomeScreen: false,
                  courseList: state.courseResponse.data,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
