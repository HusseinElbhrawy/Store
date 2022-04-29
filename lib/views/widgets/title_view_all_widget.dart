import 'package:flutter/material.dart';

class TitleWithViewAllWidget extends StatelessWidget {
  const TitleWithViewAllWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isPopularBrand = true,
  }) : super(key: key);
  final String title;
  final Function onTap;
  final bool? isPopularBrand;
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
          isPopularBrand == true
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: () => onTap(),
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
