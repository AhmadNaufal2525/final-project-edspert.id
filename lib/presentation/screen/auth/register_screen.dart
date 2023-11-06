import 'package:course_app_edspert_id/presentation/screen/auth/widgets/custom_textfield_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/auth/widgets/dropdown_button_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/auth/widgets/gender_button_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/margins.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedDropdownValue;
  bool lakiLakiSelected = false;
  bool perempuanSelected = false;
  List<String> dropdownItem = [
   'X IPA', 'X IPS', 'X BAHASA','XI IPA', 'XI IPS', 'XI BAHASA', 'XII IPA', 'XII IPS', 'XII BAHASA'
  ];

  void selectLakiLaki() {
    setState(() {
      lakiLakiSelected = true;
      perempuanSelected = false;
    });
  }

  void selectPerempuan() {
    setState(() {
      lakiLakiSelected = false;
      perempuanSelected = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          'Yuk isi data diri',
          style:
              TextStyle(color: Color(0xff000000), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.bodyColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: Margins.paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldWidget(
                hintText: 'contoh : Ihsandi80@gmail.com',
                onChanged: ((value) {}),
                text: 'Email',
              ),
              CustomTextFieldWidget(
                hintText: 'contoh : Ihsan Arditeja',
                onChanged: ((value) {}),
                text: 'Nama Lengkap',
              ),
              const Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                  children: [
                    GenderButtonWidget(
                      selected: lakiLakiSelected,
                      onTap: selectLakiLaki,
                      gendertext: 'Laki-laki',
                    ),
                    const SizedBox(width: 10),
                    GenderButtonWidget(
                      selected: perempuanSelected,
                      onTap: selectPerempuan,
                      gendertext: 'Perempuan',
                    ),
                  ],
              ),
              const SizedBox(height: 20),
              DropdownButtonWidget(
                hintText: 'pilih kelas',
                onChanged: (value) {
                  
                },
                dropdownItems: dropdownItem,
                selectedDropdownValue: selectedDropdownValue,
                text: 'Kelas',
              ),
              CustomTextFieldWidget(
                hintText: 'nama sekolah',
                onChanged: ((value) {}),
                text: 'Nama Sekolah',
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(360, 56),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide.none,
                  ),
                ),
                child: Text(
                  'Daftar',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}