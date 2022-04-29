import 'package:flutter/material.dart';

class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);
  final String title1, title2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            '$title1:\t',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            title2,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade700,
                ),
          ),
        ],
      ),
    );
  }
}
