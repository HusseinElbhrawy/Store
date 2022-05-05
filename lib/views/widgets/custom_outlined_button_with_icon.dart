import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    this.backgroundColor,
    required this.borderColor,
    required this.onTap,
    required this.title,
    required this.iconData,
    this.fontColor,
  }) : super(key: key);
  final String title;
  final Function onTap;
  final Color borderColor;
  final IconData iconData;
  final Color? backgroundColor, fontColor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => onTap(),
      icon: Icon(
        iconData,
        color: fontColor,
      ),
      label: Text(
        title,
        style: TextStyle(color: fontColor),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: backgroundColor,
        side: BorderSide(
          color: borderColor,
        ),
      ),
    );
  }
}
