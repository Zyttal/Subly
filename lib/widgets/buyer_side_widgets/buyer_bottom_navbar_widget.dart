import 'package:flutter/material.dart';
import 'package:subly_application/providers/navigation_provider.dart';

import '../../pages/buyerSide/buyer_cart_page.dart';
import '../../pages/buyerSide/buyer_home_page.dart';
import '../../pages/buyerSide/buyer_orders_page.dart';
import '../../pages/buyerSide/buyer_profile_page.dart';
import '../../stylingsAndEffects/slide_page_route.dart';

class BuyerBottomNavBar extends StatelessWidget {
  const BuyerBottomNavBar({
    super.key,
    required this.navigationProvider,
    required this.email,
  });

  final NavigationProvider navigationProvider;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).highlightColor,
        unselectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        currentIndex: navigationProvider.selectedIndex,
        onTap: (int index) {
          navigationProvider.updateSelectedIndex(index);
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                SlidePageRoute(
                  builder: (_) => BuyerHomePage(
                    email: email,
                  ),
                  settings: RouteSettings(
                      name: '/buyer_home_page', arguments: {'email': email}),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                SlidePageRoute(
                  builder: (_) => BuyersOrdersPage(
                    email: email,
                  ),
                  settings: RouteSettings(
                      name: '/buyer_orders_page', arguments: {'email': email}),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                SlidePageRoute(
                  builder: (_) => BuyersCartPage(
                    email: email,
                  ),
                  settings: RouteSettings(
                      name: '/buyer_cart_page', arguments: {'email': email}),
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                SlidePageRoute(
                  builder: (_) => BuyersProfilePage(
                    email: email,
                  ),
                  settings: RouteSettings(
                      name: '/buyer_profile_page', arguments: {'email': email}),
                ),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox(width: 40, child: Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 40, child: Icon(Icons.shopping_cart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 40, child: Icon(Icons.task_alt_outlined)),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(width: 40, child: Icon(Icons.person)),
            label: 'Profile',
          )
        ]);
  }
}
