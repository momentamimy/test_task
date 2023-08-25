import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;

  const DrawerListItem(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListTile(
            leading: Image.asset(
              icon,
              width: 25,
              height: 25,
            ),
            title: Text(title, style: const TextStyle(fontSize: 15))),
      ),
    );
  }
}
