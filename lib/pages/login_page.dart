import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subly_application/widgets/general_widgets/custom_primary_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/custom_white_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/input_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.network(
            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/loginRegisTop_yzsjcd.svg"),
        SvgPicture.network(
            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151625/Subly_Application/logo_nhe7ox.svg"),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email Address",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              const InputWidget(
                icon: Icons.email,
                hintText: "Email Address",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Password:",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 15,
              ),
              const InputWidget(
                icon: Icons.lock,
                hintText: "Password",
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.pushNamed(context, '/registration_selection');
                    },
                    child: CustomWhiteBGButton(
                      text: "Register",
                    ),
                  ),
                  CustomPrimaryBGButton(
                    text: "Sign In",
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text(
                  "or connect with",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.network(
                      "https://res.cloudinary.com/dbwwffypj/image/upload/v1702152216/Subly_Application/Icons/Vector-1_oxenyq.svg"),
                  const SizedBox(
                    width: 32,
                  ),
                  SvgPicture.network(
                      "https://res.cloudinary.com/dbwwffypj/image/upload/v1702152216/Subly_Application/Icons/Vector_jaed2h.svg"),
                  const SizedBox(
                    width: 32,
                  ),
                  SvgPicture.network(
                      "https://res.cloudinary.com/dbwwffypj/image/upload/v1702152216/Subly_Application/Icons/Vector-2_sgq1uw.svg")
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      "By Signing in, you are agreeing to our",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Terms and Privacy Policy",
                      style: TextStyle(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SvgPicture.network(
            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/loginRegisBot_znp9hu.svg"),
      ],
    ));
  }
}
