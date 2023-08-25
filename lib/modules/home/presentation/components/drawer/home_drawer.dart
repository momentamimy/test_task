import 'package:flutter/material.dart';
import 'package:test_task/modules/home/presentation/components/drawer/drawer_list_item.dart';
import 'package:test_task/modules/home/presentation/components/drawer/home_drawer_header.dart';
import 'package:test_task/res.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const HomeDrawerHeader(),
        DrawerListItem(
            icon: Res.explore,
            title: "Explore",
            onTap: () => _showItemDialog(context, title: "Explore")),
        DrawerListItem(
            icon: Res.live,
            title: "Live Chat",
            onTap: () => _showItemDialog(context, title: "Live Chat")),
        DrawerListItem(
            icon: Res.gallery,
            title: "Gallery",
            onTap: () => _showItemDialog(context, title: "Gallery")),
        DrawerListItem(
            icon: Res.wishlist,
            title: "Wish List",
            onTap: () => _showItemDialog(context, title: "Wish List")),
        DrawerListItem(
            icon: Res.e_magazine,
            title: "E-magazine",
            onTap: () => _showItemDialog(context, title: "E-magazine")),
      ]),
    );
  }

  _showItemDialog(BuildContext context, {required String title}) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text(title),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ));
  }
}
