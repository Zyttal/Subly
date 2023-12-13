import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationSelectionPage extends StatelessWidget {
  const RegistrationSelectionPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (currentPage) {
          if (currentPage.primaryVelocity! > 0) {
            Navigator.of(context).pop(); // Swipe right, navigate back
          }
        },
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              SvgPicture.network(
                  "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/loginRegisTop_yzsjcd.svg"),
            ]),
            SizedBox(
              height: 20,
            ),
            Center(
                child: SvgPicture.network(
                    "https://res.cloudinary.com/dbwwffypj/image/upload/v1702250184/Subly_Application/logoWithoutName_e1w8uy.svg")),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                "Registration",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 15),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(context, '/registration_seller');
                },
                child: Container(
                  height: 198,
                  width: 340,
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
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(children: [
                    Positioned(
                        top: 30,
                        child: Image.network(
                            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702440746/Subly_Application/Graphical%20Illustrations/SELLER_u8k747.png")),
                    Positioned(
                      right: 20,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Seller",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 187,
                            height: 108,
                            child: Text(
                                "Sellers are the ones offering things to buyers. They're like hosts, showcasing what they have for sale and helping others get what they want.",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 15),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(context, '/registration_buyer');
                },
                child: Container(
                  height: 198,
                  width: 340,
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
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(children: [
                    Positioned(
                        top: 30,
                        right: 5,
                        child: Image.network(
                            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702440746/Subly_Application/Graphical%20Illustrations/BUYER_oqgnay.png")),
                    Positioned(
                      left: 20,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Buyer",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 187,
                            height: 108,
                            child: Text(
                                "Buyers are folks looking for things they want or need, like items or services. They're the ones choosing and getting what's best for them.",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 15),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, '/registration_personal_shopper');
                },
                child: Container(
                  height: 198,
                  width: 340,
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
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(children: [
                    Positioned(
                        top: 30,
                        child: Image.network(
                            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702440746/Subly_Application/Graphical%20Illustrations/PERSONAL_SHOPPER_qgunsn.png")),
                    Positioned(
                      right: 20,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Personal Shopper",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 187,
                            height: 108,
                            child: Text(
                              "Buyers are folks looking for things they want or need, like items or services. They're the ones choosing and getting what's best for them.",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SvgPicture.network(
                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/loginRegisBot_znp9hu.svg")
          ]),
        ),
      ),
    );
  }
}
