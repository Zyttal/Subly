import 'package:flutter/material.dart';
import 'package:subly_application/pages/buyerSide/buyer_cart_page.dart';
import 'package:subly_application/pages/buyerSide/buyer_edit_profile_page.dart';
import 'package:subly_application/pages/buyerSide/buyer_home_page.dart';
import 'package:subly_application/pages/buyerSide/buyer_orders_page.dart';
import 'package:subly_application/pages/buyerSide/buyer_profile_page.dart';
import 'package:subly_application/pages/login_page.dart';
import 'package:subly_application/pages/registration/registration_buyer.dart';
import 'package:subly_application/pages/registration/registration_personal_shopper.dart';
import 'package:subly_application/pages/registration/registration_selection_page.dart';
import 'package:subly_application/pages/registration/registration_seller.dart';
import 'package:subly_application/pages/splash_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    '/': (context) => SplashPage(),
    '/login_page': (context) => LoginPage(),
    '/registration_selection': (context) => RegistrationSelectionPage(),
    '/registration_seller': (context) => RegistrationSellerDetails(),
    '/registration_buyer': (context) => RegistrationBuyerDetails(),
    '/registration_personal_shopper': (context) =>
        RegistrationPersonalShopperDetails(),
    // Buyer Side
    '/buyer_home_page': (context) => BuyerHomePage(
          email: '',
        ),
    '/buyer_orders_page': (context) => BuyersOrdersPage(
          email: '',
        ),
    '/buyer_cart_page': (context) => BuyersCartPage(
          email: '',
        ),
    '/buyer_profile_page': (context) => BuyersProfilePage(
          email: '',
        ),
    '/buyer_edit_profile': (context) => EditBuyerDetails(
          email: '',
        )
  };
}
