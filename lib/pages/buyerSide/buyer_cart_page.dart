import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_bottom_navbar_widget.dart';
import '../../providers/navigation_provider.dart';

class BuyersCartPage extends StatelessWidget {
  const BuyersCartPage({super.key});

  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: Text("Hello"),
      bottomNavigationBar:
          BuyerBottomNavBar(navigationProvider: navigationProvider),
    );
  }
}
