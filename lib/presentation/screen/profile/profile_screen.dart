import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/margins.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget currentScreen = const ProfileScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
               Navigator.of(context).pushNamed(Routes.profileEditScreen);
            },
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.bodyColor,
      body: Column(
        children: [
          Container(
            height: 101,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppColors.primaryColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ahmad Naufal',
                                style: TextStyle(
                                    color: AppColors.whiteColor, fontSize: 20),
                              ),
                              Text(
                                'SMAN 1 Margahayu',
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: Margins.paddingPage,
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: Margins.paddingPage,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 22,
                      ),
                      width: 390,
                      height: 329.16,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColors.whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Identitas Diri',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Nama Lengkap',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Ahmad Naufal Diwantara Putra',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'ahmadnaufal588@gmail.com',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Jenis Kelamin',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Laki-laki',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Kelas',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'XII-IPA',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sekolah',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'SMAN 1 Margahayu',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacementNamed(context, Routes.loginScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(390, 50),
                        backgroundColor: AppColors.whiteColor,
                        shadowColor: Colors.grey,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.login_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Keluar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
