import 'package:flutter/material.dart';

class TitleWithViewAllWidget extends StatelessWidget {
  const TitleWithViewAllWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'View All',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
