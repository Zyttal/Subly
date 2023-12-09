import 'package:flutter/material.dart';

class CustomWhiteBGButton extends StatelessWidget {
  const CustomWhiteBGButton({
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
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
      )),
    );
  }
}
