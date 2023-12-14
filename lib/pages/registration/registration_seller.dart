import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subly_application/widgets/general_widgets/custom_primary_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/custom_white_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/input_widget.dart';

class RegistrationSellerDetails extends StatelessWidget {
  const RegistrationSellerDetails({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (currentPage) {
          if (currentPage.primaryVelocity! > 0) {
            Navigator.of(context).pop();
          }
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgPicture.network(
              "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/loginRegisTop_yzsjcd.svg"),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SvgPicture.network(
                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702250184/Subly_Application/logoWithoutName_e1w8uy.svg"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Registration",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Email Address",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                  hintText: "",
                  icon: Icons.mail_outline,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Owner's Name",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                  hintText: "",
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Phone Number",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                  hintText: "",
                  icon: Icons.phone,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Business Address",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                  hintText: "",
                  icon: Icons.map_outlined,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                  hintText: "",
                  icon: Icons.lock_outline,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    CustomWhiteBGButton(text: "Cancel"),
                    CustomPrimaryBGButton(text: "Submit")
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
