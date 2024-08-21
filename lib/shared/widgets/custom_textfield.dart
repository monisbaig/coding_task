import 'package:coding_task/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String iconLink;
  final TextEditingController controller;
  final bool? enabled;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconLink,
    required this.controller,
    this.enabled,
    this.obscureText = false,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(color: whiteColor),
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SvgPicture.asset(iconLink),
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 20,
          minWidth: 30,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: whiteColor),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: redColor),
        ),
      ),
    );
  }
}
