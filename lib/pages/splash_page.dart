import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/effects/fade_page_route.dart';
import 'package:subly_application/main.dart';
import 'package:subly_application/pages/login_page.dart';
import 'package:subly_application/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SupabaseService>(
      builder: (context, supabaseService, _) {
        Future.delayed(Duration(seconds: 2), () {
          final session = supabaseService.client.auth.currentSession;
          if (session == null) {
            Navigator.of(context)
                .pushReplacement(FadePageRoute(page: LoginPage()));
          }
        });

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.network(
                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/splashTop_qix4cy.svg",
              ),
              SvgPicture.network(
                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151625/Subly_Application/logo_nhe7ox.svg",
              ),
              SvgPicture.network(
                "https://res.cloudinary.com/dbwwffypj/image/upload/v1702151534/Subly_Application/Graphical%20Assets/splashBot_ioz96x.svg",
              ),
            ],
          ),
        );
      },
    );
  }
}
