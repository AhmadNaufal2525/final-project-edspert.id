import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String alphabet;
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  const Answer({
    Key? key,
    required this.alphabet,
    required this.answer,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 47,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: isSelected ? const Color(0xb5397fd5) : Colors.white,
              border: Border.all(
                color: const Color(0xffC9C9C9),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(13),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('$alphabet.'),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    answer,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
