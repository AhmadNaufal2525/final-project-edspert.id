import 'dart:io';

import 'package:course_app_edspert_id/presentation/routes/routes.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:course_app_edspert_id/src/utils/margins.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker picker = ImagePicker();
  String? selectedGender;
  XFile? image;
  Future<void> pickImageFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  Future<void> captureImageFromCamera() async {
    final capturedImage = await picker.pickImage(source: ImageSource.camera);
    if (capturedImage != null) {
      setState(() {
        image = capturedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Akun',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: Margins.paddingPage,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Data Diri',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Pilih Gambar"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                pickImageFromGallery();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_camera),
                              title: const Text('Camera'),
                              onTap: () {
                                Navigator.pop(context);
                                captureImageFromCamera();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Stack(
                  children: [
                    Center(
                      child: image != null
                          ? CircleAvatar(
                              radius: 40,
                              backgroundImage: FileImage(
                                File(image!.path),
                              ),
                            )
                          : const CircleAvatar(
                              radius: 40,
                              child: Icon(
                                Icons.image,
                                size: 30,
                              ),
                            ),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 0,
                      right: 0,
                      top: 50,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.titleColor,
                            radius: 12,
                            child: const Icon(
                              Icons.add,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nama Lengkap',
                style: TextStyle(
                  color: Color(0xff99A1AC),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Nama Lengkap',
                  hintStyle: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  color: Color(0xff99A1AC),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'helloaltop@gmail.com',
                  hintStyle: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Jenis Kelamin',
                style: TextStyle(
                  color: Color(0xff99A1AC),
                ),
              ),
              DropdownButtonFormField<String>(
                hint: const Text('Pilih Jenis Kelamin'),
                value: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
                items: ['Laki-laki', 'Perempuan'].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Kelas',
                style: TextStyle(
                  color: Color(0xff99A1AC),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'contoh: XII - IPA',
                  hintStyle: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Sekolah',
                style: TextStyle(
                  color: Color(0xff99A1AC),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'contoh: SMAN 1 Bandung',
                  hintStyle: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.profileScreen);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(370, 50),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
