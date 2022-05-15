import 'package:flutter/material.dart';

class CustomUserListTile extends StatelessWidget {
  const CustomUserListTile(
      {Key? key,
      required this.subTitle,
      required this.title,
      required this.leading,
      this.showNumber = false,
      this.onTap,
      this.tralling})
      : super(key: key);
  final String title, subTitle;
  final Widget leading;
  final VoidCallback? onTap;
  final Widget? tralling;
  final bool? showNumber;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.red,
        child: ListTile(
          onTap: onTap,
          enableFeedback: true,
          isThreeLine: false,
          title: Text(title),
          subtitle: Text(subTitle),
          leading: leading,
          trailing: tralling,
        ),
      ),
    );
  }
}
