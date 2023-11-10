import 'package:flutter/material.dart';

class QuestionNumberWidget extends StatelessWidget {
  final String number;
  final bool isSelected;
  final bool isKumpulin;
  const QuestionNumberWidget({super.key, required this.number, required this.isSelected, required this.isKumpulin});

  @override
  Widget build(BuildContext context) {
    final bool isDone = isKumpulin; 
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isDone ? const Color(0xff04C3BF) : const Color(0xff3A7FD5),
              width: 1.0,
            ),
          ),
          child: CircleAvatar(
            radius: 12,
            backgroundColor:
               isDone ? const Color(0xff04C3BF) : (isSelected ? const Color(0xff3A7FD5) : Colors.white),
            child: Text(
              number,
              style: TextStyle(
                fontSize: 10,
                 color:  (isSelected ? Colors.white : const Color(0xff3A7FD5)),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
