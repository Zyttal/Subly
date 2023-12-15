import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/providers/buyer_registration_provider.dart';
import 'package:subly_application/widgets/general_widgets/build_snack_bar.dart';
import 'package:subly_application/widgets/general_widgets/custom_primary_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/custom_white_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/input_widget.dart';
import '../../supabase_service.dart';

class RegistrationBuyerDetails extends StatelessWidget {
  const RegistrationBuyerDetails({super.key});

  Widget build(BuildContext context) {
    final supabaseProvider = Provider.of<SupabaseService>(context);

    return ChangeNotifierProvider(
      create: (_) => BuyerRegistrationProvider(),
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (currentPage) {
            if (currentPage.primaryVelocity! > 0) {
              Navigator.of(context).pop();
            }
          },
          child: Consumer<BuyerRegistrationProvider>(
              builder: (context, provider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  padding: EdgeInsets.only(left: 40),
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
                          height: 15,
                        ),
                        InputWidget(
                          hintText: "",
                          icon: Icons.mail_outline,
                          controller: provider.emailController,
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Full Name",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InputWidget(
                          hintText: "",
                          icon: Icons.person,
                          controller: provider.nameController,
                          isPassword: false,
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
                          controller: provider.phoneController,
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Home Address",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InputWidget(
                          hintText: "",
                          icon: Icons.map_outlined,
                          controller: provider.addressController,
                          isPassword: false,
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
                          controller: provider.passwordController,
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login_page');
                              },
                              child: CustomWhiteBGButton(text: "Cancel"),
                            ),
                            InkWell(
                              onTap: () async {
                                final email = provider.emailController.text;
                                final fullName = provider.nameController.text;
                                final phoneNumber =
                                    provider.phoneController.text;
                                final homeAddress =
                                    provider.addressController.text;
                                final password =
                                    provider.passwordController.text;

                                // print('Email: $email');
                                // print('Full Name: $fullName');
                                // print('Phone Number: $phoneNumber');
                                // print('Home Address: $homeAddress');
                                // print('Password: $password');

                                bool registrationSuccessful =
                                    await supabaseProvider.insertBuyer(
                                        email: email,
                                        fullName: fullName,
                                        phoneNumber: phoneNumber,
                                        homeAddress: homeAddress,
                                        password: password);

                                if (registrationSuccessful) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      buildSnackBar("Registration Successful!",
                                          true, context));
                                  Navigator.pushNamed(context, '/login_page');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      buildSnackBar("Registration Failed!",
                                          false, context));
                                }
                              },
                              child: CustomPrimaryBGButton(text: "Submit"),
                            ),
                          ],
                        )
                      ]),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
