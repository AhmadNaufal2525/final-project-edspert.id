import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedGender;
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
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
            ],
          ),
        ),
      ),
    );
  }
}