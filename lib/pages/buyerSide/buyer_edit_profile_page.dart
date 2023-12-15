import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/providers/buyer_registration_provider.dart';
import 'package:subly_application/widgets/general_widgets/build_snack_bar.dart';
import 'package:subly_application/widgets/general_widgets/custom_primary_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/custom_white_bg_button.dart';
import 'package:subly_application/widgets/general_widgets/input_widget.dart';
import '../../supabase_service.dart';

class EditBuyerDetails extends StatelessWidget {
  const EditBuyerDetails({super.key, required this.email});
  final String email;
  Widget build(BuildContext context) {
    final supabaseProvider = Provider.of<SupabaseService>(context);
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String receivedEmail = args?['email'] ?? 'No Email Received';

    return ChangeNotifierProvider(
      create: (_) => BuyerRegistrationProvider(),
      child: Scaffold(
          body: FutureBuilder<Map<String, dynamic>?>(
        future: supabaseProvider.getBuyer(receivedEmail),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(child: CircularProgressIndicator()));
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              final buyerInfo = snapshot.data;
              final provider = Provider.of<BuyerRegistrationProvider>(context,
                  listen: false);

              print(buyerInfo);
              provider.emailController.text = buyerInfo?['email_address'];
              provider.nameController.text = buyerInfo?['full_name'];
              provider.phoneController.text = buyerInfo?['phone_number'];
              provider.addressController.text = buyerInfo?['home_address'];
              provider.passwordController.text = buyerInfo?['password'];

              return GestureDetector(
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
                                "Edit Profile",
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
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      borderRadius: BorderRadius.circular(25),
                                      child:
                                          CustomWhiteBGButton(text: "Cancel")),
                                  InkWell(
                                    onTap: () async {
                                      final id = buyerInfo?['id'];
                                      final email =
                                          provider.emailController.text;
                                      final fullName =
                                          provider.nameController.text;
                                      final phoneNumber =
                                          provider.phoneController.text;
                                      final homeAddress =
                                          provider.addressController.text;
                                      final password =
                                          provider.passwordController.text;

                                      // print('id: $id');
                                      // print('Email: $email');
                                      // print('Full Name: $fullName');
                                      // print('Phone Number: $phoneNumber');
                                      // print('Home Address: $homeAddress');
                                      // print('Password: $password');

                                      bool editProfileSuccessful =
                                          await supabaseProvider.updateBuyer(
                                              id: id,
                                              email: email,
                                              fullName: fullName,
                                              phoneNumber: phoneNumber,
                                              homeAddress: homeAddress,
                                              password: password);

                                      if (editProfileSuccessful) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(buildSnackBar(
                                                "Profile Succesfully edited!",
                                                true,
                                                context));
                                        Navigator.pushNamed(
                                            context, '/buyer_profile_page',
                                            arguments: ({'email': email}));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(buildSnackBar(
                                                "Profile Edit Failed!",
                                                false,
                                                context));
                                      }
                                    },
                                    child:
                                        CustomPrimaryBGButton(text: "Submit"),
                                  ),
                                ],
                              )
                            ]),
                      )
                    ],
                  );
                }),
              );
            } else {
              return Center(
                child: Text(
                  "Failed to fetch Buyer Information",
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              );
            }
          }
        },
      )),
    );
  }
}
