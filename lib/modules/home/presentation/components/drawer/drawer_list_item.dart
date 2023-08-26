import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;
  final bool isSelected;

  const DrawerListItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          if (isSelected) Container(color: Colors.black, height: 50, width: 5),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
