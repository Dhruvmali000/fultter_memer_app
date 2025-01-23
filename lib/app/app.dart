import 'package:flutter/material.dart';
import 'package:fultter_memer_app/themes.dart';
import 'package:fultter_memer_app/views/homeview.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MyThemes.lightScheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MyThemes.darkScheme(),
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const Homeview(),
    );
  }
}
