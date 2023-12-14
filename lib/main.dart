import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/pages/login_page.dart';
import 'package:subly_application/pages/registration/buyer/registration_buyer.dart';
import 'package:subly_application/pages/registration/personal_shopper/registration_personal_shopper.dart';
import 'package:subly_application/pages/registration/registration_selection_page.dart';
import 'package:subly_application/pages/registration/seller/registration_seller.dart';
import 'package:subly_application/pages/splash_page.dart';
import 'package:subly_application/services/supabase_service.dart';

void main() => runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = GoogleFonts.poppinsTextTheme(TextTheme(
        displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000080)),
        headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF000080)),
        labelMedium: const TextStyle(
          fontSize: 16,
        ),
        bodySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
        displaySmall:
            TextStyle(fontSize: 13, color: Theme.of(context).hintColor)));

    return ChangeNotifierProvider(
      create: (_) => SupabaseService()..initializeSupabase(),
      child: MaterialApp(
        title: 'Subly',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashPage(),
          '/login_page': (context) => LoginPage(),
          '/registration_selection': (context) => RegistrationSelectionPage(),
          '/registration_seller': (context) => RegistrationSellerDetails(),
          '/registration_buyer': (context) => RegistrationBuyerDetails(),
          '/registration_personal_shopper': (context) =>
              RegistrationPersonalShopperDetails()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: textTheme,
            primaryColor: const Color(0xFF000080),
            highlightColor: const Color(0xFFFFBD59),
            hintColor: const Color(0xFF747070)),
      ),
    );
  }
}
