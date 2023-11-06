import 'package:flutter/material.dart';

class CardCourseWidget extends StatelessWidget {
  final String? image;
  final String courseName;
  final String coursePacket;
  final double value;
  final Function() onTap;
  const CardCourseWidget(
      {super.key,
      this.image,
      required this.courseName,
      required this.coursePacket,
      required this.value,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
            height: 96,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xffF3F7F8),
                  ),
                  child: Image.network(
                    image!,
                    height: 30,
                    width: 30,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/icons/matematika.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        coursePacket,
                        style: const TextStyle(
                            color: Color(0xff8E8E8E), fontSize: 12),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        value: value,
                        backgroundColor: const Color(0xffF0F0F0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
