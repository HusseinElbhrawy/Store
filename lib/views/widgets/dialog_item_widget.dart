import 'package:flutter/material.dart';

class DialogItemWidget extends StatelessWidget {
  const DialogItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(children: [
          Icon(
            icon,
            color: color,
          ),
          const VerticalDivider(),
          Text(title),
        ]),
      ),
    );
  }
}
