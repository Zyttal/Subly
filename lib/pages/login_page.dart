import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SvgPicture.network(
            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702136514/Subly_Application/loginTop_zqplxk.svg"),
        const SizedBox(
          height: 30,
        ),
        SvgPicture.network(
            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702136515/Subly_Application/logo_kbeo6w.svg"),
        Text(
          "Email Address",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Container(
          width: 310,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xF3F3F3),
          ),
        ),
        Text(
          "Password:",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    ));
  }
}
