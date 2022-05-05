import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.validator,
    this.suffixIcon,
  }) : super(key: key);
  final String hint;
  final IconData iconData;
  final Function(String? newChange) validator;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (newvalue) => validator(newvalue),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          iconData,
          color: ConstColors.purple800,
        ),
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ConstColors.purple800,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
