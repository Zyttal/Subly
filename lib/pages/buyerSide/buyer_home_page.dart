import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/supabase_service.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_bottom_navbar_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/item_card_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_search_widget.dart';
import 'package:subly_application/widgets/buyer_side_widgets/store_card_widget.dart';

import '../../providers/navigation_provider.dart';

class BuyerHomePage extends StatelessWidget {
  const BuyerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final supabaseProvider = Provider.of<SupabaseService>(context);

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
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: supabaseProvider.fetchSellers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available'));
                      } else {
                        final sellers = snapshot.data!;
                        return ListView.builder(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemCount: sellers.length,
                          padding: EdgeInsets.only(right: 20),
                          itemBuilder: (context, index) {
                            final seller = sellers[index];
                            return StoreCardWidget(
                                imgURL: seller['store_img_URL']);
                          },
                        );
                      }
                    },
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
                      child: FutureBuilder<List<Map<String, dynamic>>>(
                        future: supabaseProvider.fetchItems(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No data available'));
                          } else {
                            final items = snapshot.data!;
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              clipBehavior: Clip.none,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return ItemCardWidget(
                                    imgURL: item['img_URL'],
                                    itemName: item['item_name'],
                                    itemPrice: item['item_price'].toDouble(),
                                    itemStore: item['seller_id']['store_name']);
                              },
                            );
                          }
                        },
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
