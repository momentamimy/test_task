import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String msg;
  final Function onReload;

  const AppErrorWidget({super.key, required this.msg, required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(msg),
          const SizedBox(height: 5),
          ElevatedButton(
              onPressed: () => onReload(), child: const Text("Reload Data"))
        ],
      ),
    );
  }
}
