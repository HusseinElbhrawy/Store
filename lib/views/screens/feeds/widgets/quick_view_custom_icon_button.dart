import 'package:flutter/material.dart';

class QuickViewCustomIconButton extends StatelessWidget {
  const QuickViewCustomIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    required this.title,
    this.color = Colors.grey,
  }) : super(key: key);
  final IconData iconData;
  final Function onTap;
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: IconButton(
                color: Colors.red,
                onPressed: () => onTap(),
                icon: Icon(
                  iconData,
                  color: color,
                ),
              ),
            ),
            const SizedBox(height: 5),
            FittedBox(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
