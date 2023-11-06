import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final TextEditingController? controller;
  final bool isReadOnly;
  final String text;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.initialValue,
    this.controller,
    required this.onChanged,
    this.isReadOnly = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            readOnly: isReadOnly,
            initialValue: initialValue,
            onChanged: onChanged,
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              errorStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD6D6D6), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD6D6D6), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
