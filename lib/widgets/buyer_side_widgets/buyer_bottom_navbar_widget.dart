import 'package:flutter/material.dart';
import 'package:subly_application/pages/navigation_provider.dart';

class BuyerBottomNavBar extends StatelessWidget {
  const BuyerBottomNavBar({
    super.key,
    required this.navigationProvider,
  });

  final NavigationProvider navigationProvider;

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
              Navigator.pushNamed(context, '/buyer_home_page');
              break;
            case 1:
              Navigator.pushNamed(context, '/buyer_orders_page');
              break;
            case 2:
              Navigator.pushNamed(context, '/buyer_cart_page');
              break;
            case 3:
              Navigator.pushNamed(context, '/buyer_profile_page');
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
