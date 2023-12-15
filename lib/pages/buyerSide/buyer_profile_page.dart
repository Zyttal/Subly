import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/providers/navigation_provider.dart';
import 'package:subly_application/supabase_service.dart';
import 'package:subly_application/widgets/buyer_side_widgets/basic_buyer_information_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_bottom_navbar_widget.dart';
import 'package:subly_application/widgets/general_widgets/custom_primary_bg_button.dart';

import '../../widgets/general_widgets/build_snack_bar.dart';

class BuyersProfilePage extends StatelessWidget {
  const BuyersProfilePage({super.key, required this.email});
  final String email;
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final supabaseService = Provider.of<SupabaseService>(context);
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String receivedEmail = args?['email'] ?? 'No Email Received';

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (currentPage) {
          if (currentPage.primaryVelocity! > 0) {
            Navigator.of(context).pop();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.network(
                      "https://res.cloudinary.com/dbwwffypj/image/upload/v1702548603/Subly_Application/Graphical%20Assets/general_top_k7zvom.svg"),
                  Positioned(
                      top: 40,
                      left: 25,
                      child: Text(
                        "Profile",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  Positioned(
                    top: 87,
                    left: 119,
                    child: Image.network(
                        "https://res.cloudinary.com/dbwwffypj/image/upload/v1702605854/Subly_Application/Buyer%20Profiles/User_07b_x0bpzo.png"),
                  )
                ],
              ),
              SizedBox(
                height: 85,
              ),
              Center(
                child: Text(
                  "Buyer",
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Center(
                child: BasicBuyerInformationWidget(
                    supabaseService: supabaseService, email: receivedEmail),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 195,
                  width: 342,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(50, 0, 0, 0),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: (Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment Method",
                          style: GoogleFonts.poppins(
                              fontSize: 13, color: Theme.of(context).hintColor),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PaymentMethodWidget(
                              isSelected: true,
                              imgURL:
                                  "https://res.cloudinary.com/dbwwffypj/image/upload/v1702382116/Subly_Application/Graphical%20Assets/gcash_payment_method_kgodjm.png",
                            ),
                            PaymentMethodWidget(
                              isSelected: false,
                              imgURL:
                                  "https://res.cloudinary.com/dbwwffypj/image/upload/v1702382105/Subly_Application/Graphical%20Assets/paypal_payment_method_isqwga.png",
                            ),
                            PaymentMethodWidget(
                              isSelected: false,
                              imgURL:
                                  "https://res.cloudinary.com/dbwwffypj/image/upload/v1702382104/Subly_Application/Graphical%20Assets/PayMaya_payment_method_ifbbld.png",
                            ),
                            PaymentMethodWidget(
                              isSelected: false,
                              imgURL:
                                  "https://res.cloudinary.com/dbwwffypj/image/upload/v1702382104/Subly_Application/Graphical%20Assets/PayMaya_payment_method_ifbbld.png",
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Payment Method",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context).hintColor),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Theme.of(context).hintColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Set as Default",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context).hintColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Account Number",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () async {
                    final bool status =
                        await supabaseService.deleteBuyer(receivedEmail);

                    if (status) {
                      ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
                          "Account Successfully deleted!", true, context));
                      Navigator.pushNamed(context, '/login_page');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
                          "Account Deletion Failed!", false, context));
                    }
                  },
                  child: CustomPrimaryBGButton(text: "Delete Account"),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BuyerBottomNavBar(
        navigationProvider: navigationProvider,
        email: email,
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.imgURL,
    required this.isSelected,
  });
  final String imgURL;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isSelected ? Theme.of(context).highlightColor : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]),
      child: Image.network(imgURL),
    );
  }
}
