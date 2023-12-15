import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subly_application/supabase_service.dart';

class BasicBuyerInformationWidget extends StatelessWidget {
  const BasicBuyerInformationWidget({
    super.key,
    required this.supabaseService,
    required this.email,
  });

  final SupabaseService supabaseService;
  final String email;

  @override
  Widget build(BuildContext context) {
    // print(email);
    return Container(
      width: 342,
      height: 170,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(18)),
      child: Center(
          child: Container(
              margin: EdgeInsets.all(20),
              child: FutureBuilder<Map<String, dynamic>?>(
                  future: supabaseService.getBuyer(email),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      if (snapshot.hasData && snapshot.data != null) {
                        final buyerInfo = snapshot.data;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Basic Information",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Theme.of(context).hintColor),
                                ),
                                InkWell(
                                    borderRadius: BorderRadius.circular(25),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/buyer_edit_profile',
                                          arguments: {'email': email});
                                    },
                                    child: SvgPicture.network(
                                        "https://res.cloudinary.com/dbwwffypj/image/upload/v1702610715/Subly_Application/Icons/edit_klcxje.svg"))
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).hintColor,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Full Name",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Theme.of(context).hintColor),
                                ),
                                Text(
                                  buyerInfo?['full_name'],
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Email Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Theme.of(context).hintColor),
                                ),
                                Text(
                                  buyerInfo?['email_address'],
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Contact Details",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Theme.of(context).hintColor),
                                ),
                                Text(
                                  buyerInfo?['phone_number'],
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Business Address",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: Theme.of(context).hintColor),
                                ),
                                Text(
                                  buyerInfo?['home_address'],
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text(
                            "Failed to fetch buyer information",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                            ),
                          ),
                        );
                      }
                    }
                  }))),
    );
  }
}
