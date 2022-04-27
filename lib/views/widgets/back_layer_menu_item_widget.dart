import 'package:flutter/material.dart';

class BackLayerMenuItemWidget extends StatelessWidget {
  const BackLayerMenuItemWidget({
    Key? key,
    required this.iconData,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final Function() onTap;
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(iconData),
        ],
      ),
    );
  }
}
