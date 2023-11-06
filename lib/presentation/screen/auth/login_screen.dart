import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/presentation/screen/auth/widgets/custom_rounded_button_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/margins.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: Margins.paddingPage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/login_ilustrator.png',
                  width: 360,
                  height: 255,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6A7483),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.registerScreen);
                  },
                  icon: const Icon(Icons.app_registration_sharp),
                  label: const Text('Daftar Akun'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: Margins.marginPage,
                        child: Divider(
                          color: AppColors.dividerColor,
                          height: 36,
                        ),
                      ),
                    ),
                    Text(
                      "Masuk dengan",
                      style: TextStyle(
                        color: AppColors.dividerColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: Margins.marginPage,
                        child: Divider(
                          color: AppColors.dividerColor,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRoundedButtonWidget(
                      image: 'assets/icons/google-logo.png',
                      onPressed: () {
                         Navigator.pushNamed(context, Routes.homeScreen);
                      },
                      label: 'Masuk dengan Google',
                      backgroundColor: AppColors.whiteColor,
                      textColor: AppColors.titleColor,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomRoundedButtonWidget(
                      image: 'assets/icons/apple-logo.png',
                      backgroundColor: AppColors.titleColor,
                      onPressed: () {
                         Navigator.pushNamed(context, Routes.homeScreen);
                      }, 
                      label: 'Masuk dengan Apple ID',
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}