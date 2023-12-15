import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.isPassword,
  });

  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 40,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFFAEAEAE),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
