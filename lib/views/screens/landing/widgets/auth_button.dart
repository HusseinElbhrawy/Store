import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.bgColor,
    this.minWidth,
    this.height,
  }) : super(key: key);
  final Function? onTap;
  final String title;
  final Color bgColor;
  final double? minWidth;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap != null ? () => onTap!() : null,
      minWidth: minWidth,
      height: height,
      child: Text(title),
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
