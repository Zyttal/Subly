import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/providers/navigation_provider.dart';
import 'package:subly_application/widgets/buyer_side_widgets/buyer_bottom_navbar_widget.dart';

class BuyersOrdersPage extends StatelessWidget {
  const BuyersOrdersPage({super.key, required this.email});
  final String email;

  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: Text("hey $email"),
      bottomNavigationBar: BuyerBottomNavBar(
        navigationProvider: navigationProvider,
        email: email,
      ),
    );
  }
}
