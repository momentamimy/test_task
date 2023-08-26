import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/modules/home/presentation/components/drawer/drawer_list_item.dart';
import 'package:test_task/modules/home/presentation/components/drawer/home_drawer_header.dart';
import 'package:test_task/modules/home/presentation/provider/home_provider.dart';
import 'package:test_task/res.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    return Drawer(
      child: Column(children: [
        const HomeDrawerHeader(),
        DrawerListItem(
          isSelected: provider.selectedDrawerItem == "Explore",
            icon: Res.explore,
            title: "Explore",
            onTap: () => _selectItem(context, title: "Explore")),
        DrawerListItem(
            isSelected: provider.selectedDrawerItem == "Live Chat",
            icon: Res.live,
            title: "Live Chat",
            onTap: () => _selectItem(context, title: "Live Chat")),
        DrawerListItem(
            isSelected: provider.selectedDrawerItem == "Gallery",
            icon: Res.gallery,
            title: "Gallery",
            onTap: () => _selectItem(context, title: "Gallery")),
        DrawerListItem(
            isSelected: provider.selectedDrawerItem == "Wish List",
            icon: Res.wishlist,
            title: "Wish List",
            onTap: () => _selectItem(context, title: "Wish List")),
        DrawerListItem(
            isSelected: provider.selectedDrawerItem == "E-magazine",
            icon: Res.eMagazine,
            title: "E-magazine",
            onTap: () => _selectItem(context, title: "E-magazine")),
      ]),
    );
  }

  _selectItem(BuildContext context, {required String title}) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.selectedDrawerItem = title;
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
