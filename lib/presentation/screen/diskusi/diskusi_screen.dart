import 'package:course_app_edspert_id/presentation/screen/diskusi/widgets/chat_widget.dart';
import 'package:course_app_edspert_id/presentation/screen/diskusi/widgets/user_chat_widget.dart';
import 'package:course_app_edspert_id/src/utils/colors.dart';
import 'package:flutter/material.dart';

class DiskusiScreen extends StatefulWidget {
  const DiskusiScreen({super.key});

  @override
  State<DiskusiScreen> createState() => _DiskusiScreenState();
}

class _DiskusiScreenState extends State<DiskusiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Diskusi Soal',
          style: TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: AppColors.bodyColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CardChat(
              name: 'Tutor Arin',
              text:
                  'Halo, Perkenalkan saya Arin yang akan\nmenjadi pembimbing kalian di grub ini.',
              time: '29m',
              colorName: Color(0xff00C4FF),
              colorContainer: Color(0xffE0F8FF),
            ),
            UserChat(
              name: 'Saya',
              text: 'Baik Kak, terimakasih',
              time: '29m',
            ),
            CardChat(
              name: 'Andy',
              text: 'Halo semua saya Bayu dari SMAN 3\nYogyakarta.',
              time: '30m',
              colorName: Color(0xff5200FF),
              colorContainer: Color(0xffEAE0FF),
            ),
            CardChat(
              name: 'Karina',
              text: 'Halo semua saya Bayu dari SMAN 1\nSurabaya.',
              time: '30m',
              colorName: Color(0xffFF0000),
              colorContainer: Color(0xffFFDCDC),
            ),
            CardChat(
              name: 'Bayu',
              text: 'Halo semua saya Bayu dari SMAN 3\nYogyakarta.',
              time: '30m',
              colorName: Color(0xff5200FF),
              colorContainer: Color(0xffEAE0FF),
            ),
            CardChat(
              name: 'Naufal',
              text: 'Halo semua saya Naufal dari SMAN 1\nYogyakarta',
              time: '30m',
              colorName: Color(0xffFF0000),
              colorContainer: Color(0xffFFDCDC),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xffF6F6F6),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 272,
                  child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Ketuk untuk menulis...',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: const Color(0xffF6F6F6),
                      filled: true,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}