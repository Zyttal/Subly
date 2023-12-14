import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subly_application/pages/navigation_provider.dart';
import 'package:subly_application/routes.dart';
import 'package:subly_application/supabase_service.dart';
import 'package:subly_application/stylingsAndEffects/theme.dart';

void main() => runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SupabaseService>(
          create: (_) => SupabaseService()..initializeSupabase(),
        ),
        ChangeNotifierProvider<NavigationProvider>(
          create: (_) => NavigationProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Subly',
          initialRoute: '/',
          routes: getApplicationRoutes(),
          debugShowCheckedModeBanner: false,
          theme: getCustomThemeData(context)),
    );
  }
}
