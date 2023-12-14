import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/pages/navigation_provider.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_bottom_navbar_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/item_card_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_search_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/store_card_widget.dart';

class BuyerHomePage extends StatelessWidget {
  const BuyerHomePage({super.key});

  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
        extendBody: true,
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
                children: [
                  SvgPicture.network(
                      "https://res.cloudinary.com/dbwwffypj/image/upload/v1702548603/Subly_Application/Graphical%20Assets/general_top_k7zvom.svg"),
                  Positioned(
                      top: 40,
                      left: 25,
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  Positioned(
                      top: 90,
                      left: 20,
                      child: Container(
                        width: 350,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(50, 0, 0, 0),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                spreadRadius: 0,
                              )
                            ]),
                        child: BuyerSearchWidget(),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Nearby Stores",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 150,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      StoreCardWidget(
                        imgURL:
                            "https://res.cloudinary.com/dbwwffypj/image/upload/v1702556187/Subly_Application/Store%20Pictures/robinsons_easymart_yh9jux.png",
                      ),
                      StoreCardWidget(
                          imgURL:
                              "https://res.cloudinary.com/dbwwffypj/image/upload/v1702556187/Subly_Application/Store%20Pictures/forever_heart_fwaefp.jpg"),
                      StoreCardWidget(
                          imgURL:
                              "https://res.cloudinary.com/dbwwffypj/image/upload/v1702556552/Subly_Application/Store%20Pictures/shopwise_wdbhzb.jpg"),
                      SizedBox(
                        width: 25,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Featured Items",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Container(
                      clipBehavior: Clip.none,
                      width: 500,
                      height: 450,
                      padding: EdgeInsets.only(top: 10),
                      child: GridView.count(
                        clipBehavior: Clip.none,
                        crossAxisCount: 2,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          ItemCardWidget(
                            imgURL:
                                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702557450/Subly_Application/Products/Grass_d3rz9k.png",
                            itemName: "Broccoli (1kg)",
                            itemPrice: "₱34.75",
                            itemStore: "Forever Heart",
                          ),
                          ItemCardWidget(
                            imgURL:
                                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702557449/Subly_Application/Products/Apple_d5k3ws.png",
                            itemName: "Apple (0.5)",
                            itemPrice: "₱50.75",
                            itemStore: "Forever Heart",
                          ),
                          ItemCardWidget(
                            imgURL:
                                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702557450/Subly_Application/Products/watah_ckhsth.png",
                            itemName: "Water(500m)",
                            itemPrice: "₱25.00",
                            itemStore: "Quickmart oasis",
                          ),
                          ItemCardWidget(
                            imgURL:
                                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702557449/Subly_Application/Products/carrot_apgdvx.png",
                            itemName: "Carrots (0.5g)",
                            itemPrice: "₱34.75",
                            itemStore: "Forever Heart",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
        bottomNavigationBar:
            BuyerBottomNavBar(navigationProvider: navigationProvider));
  }
}
