import 'package:flutter/material.dart';
import 'package:flutter_sau_car_installment_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FlutterSauCarInstallmentApp());
}

class FlutterSauCarInstallmentApp extends StatefulWidget {
  const FlutterSauCarInstallmentApp({super.key});

  @override
  State<FlutterSauCarInstallmentApp> createState() => _FlutterSauCarInstallmentAppState();
}

class _FlutterSauCarInstallmentAppState extends State<FlutterSauCarInstallmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      );
  }
}

