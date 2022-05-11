import 'package:flutter/material.dart';
import 'package:store_app/constants/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.validator,
    this.suffixIcon,
    this.textEditingController,
    this.focusNode,
    this.onSubmit,
    this.textInputAction,
    this.isPassword,
  }) : super(key: key);
  final String hint;
  final bool? isPassword;
  final IconData iconData;
  final Function(String? newChange) validator;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textInputAction: textInputAction,
      controller: textEditingController,
      validator: (newvalue) => validator(newvalue),
      onFieldSubmitted: onSubmit,
      obscureText: isPassword ?? false,
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
