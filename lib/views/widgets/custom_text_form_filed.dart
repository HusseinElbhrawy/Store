import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/utils/style/colors.dart';

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
    this.keyboard = TextInputType.text,
    this.formatters,
    this.enabled = true,
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
  final TextInputType? keyboard;
  final List<TextInputFormatter>? formatters;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      inputFormatters: formatters,
      autocorrect: true,
      enableSuggestions: true,
      focusNode: focusNode,
      textInputAction: textInputAction,
      controller: textEditingController,
      validator: (newvalue) => validator(newvalue),
      onFieldSubmitted: onSubmit,
      keyboardType: keyboard,
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
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
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
