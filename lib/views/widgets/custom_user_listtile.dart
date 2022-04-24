import 'package:flutter/material.dart';

class CustomUserListTile extends StatelessWidget {
  const CustomUserListTile({
    Key? key,
    required this.iconData,
    required this.subTitle,
    required this.title,
    required this.onTap,
    this.tralling,
  }) : super(key: key);
  final String title, subTitle;
  final IconData iconData;
  final Function onTap;
  final Widget? tralling;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.red,
        child: ListTile(
          onTap: () => onTap(),
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(iconData),
          trailing: tralling,
        ),
      ),
    );
  }
}
