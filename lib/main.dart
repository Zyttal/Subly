import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subly_application/pages/login_page.dart';

void main() => runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = GoogleFonts.poppinsTextTheme(TextTheme(
        labelMedium: const TextStyle(
          fontSize: 16,
        ),
        displaySmall:
            TextStyle(fontSize: 13, color: Theme.of(context).hintColor)));

    return MaterialApp(
      title: 'Subly',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: textTheme,
          primaryColor: const Color(0xFF000080),
          highlightColor: const Color(0xFFFFBD59),
          hintColor: const Color(0xFF747070)),
    );
  }
}
