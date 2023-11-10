import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/presentation/screen/auth/login_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/auth/register_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/auth/splash_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/course/exercise/exercise_result_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/course/exercise/exercise_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/diskusi/diskusi_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/home/home_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/profile/edit_profile_screen.dart';
import 'package:course_app_edspert_id/presentation/screen/profile/profile_screen.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edspert.id',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 20,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          elevation: 0,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: '/',
      routes: {
        Routes.splashScreen: (context) => const SplashScreen(),
        Routes.loginScreen: (context) => const LoginScreen(),
        Routes.registerScreen: (context) => const RegisterScreen(),
        Routes.homeScreen: (context) => HomeScreen(),
        Routes.exerciseScreen: (context) => const ExerciseScreen(),
        Routes.resultScreen:(context) => const ExerciseResultScreen(),
        Routes.profileScreen:(context) => const ProfileScreen(),
        Routes.profileEditScreen:(context) => const EditProfileScreen(),
        Routes.diskusiScreen:(context) => const DiskusiScreen(),
      },
    );
  }
}
