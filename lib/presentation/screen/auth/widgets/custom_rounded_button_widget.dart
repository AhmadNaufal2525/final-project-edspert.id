import 'package:flutter/material.dart';

class CustomRoundedButtonWidget extends StatelessWidget {
  final String image;
  final Color? backgroundColor, textColor;
  final String label;
  final VoidCallback onPressed;
  const CustomRoundedButtonWidget(
      {super.key, required this.image, this.backgroundColor, required this.onPressed, required this.label, this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(350, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
      ),
      icon: Image.asset(
        image,
        width: 24,
        height: 24,
      ),
      label: Text(
        label,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
