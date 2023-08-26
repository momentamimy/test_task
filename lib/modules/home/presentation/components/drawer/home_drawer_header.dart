import 'package:flutter/material.dart';
import 'package:test_task/res.dart';

class HomeDrawerHeader extends StatelessWidget {
  const HomeDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).closeDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListTile(
          leading: Image.asset(
            Res.profile,
            width: 60,
            height: 60,
          ),
          title: const Text("Welcome",
              style: TextStyle(color: Colors.black54, fontSize: 13)),
          subtitle: const Text("Tony Roshdy", style: TextStyle(fontSize: 15)),
          trailing: Image.asset(
            Res.arrow,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
