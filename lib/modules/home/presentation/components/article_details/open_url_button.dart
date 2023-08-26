import 'package:flutter/material.dart';

class OpenUrlButton extends StatelessWidget {
  final Function onTap;
  const OpenUrlButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          backgroundColor: Colors.black),
      child: const Padding(
        padding: EdgeInsets.all(15),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text("OPEN WEBSITE",
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
