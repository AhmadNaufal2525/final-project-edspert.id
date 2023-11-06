import 'package:flutter/material.dart';

class GenderButtonWidget extends StatelessWidget {
  final String gendertext;
  final bool selected;
  final VoidCallback onTap;

  const GenderButtonWidget({
    super.key,
    required this.selected,
    required this.onTap,
    required this.gendertext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 175.2,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              border: Border.all(
                color: selected ? Colors.black : const Color(0xffD6D6D6),
              ),
            ),
            child: Center(
              child: Text(
                gendertext,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
