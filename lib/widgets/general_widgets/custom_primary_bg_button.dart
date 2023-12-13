import 'package:flutter/material.dart';

class CustomPrimaryBGButton extends StatelessWidget {
  const CustomPrimaryBGButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
          child: Text(
        "Sign In",
        style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
