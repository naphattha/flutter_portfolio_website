import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/home_page.dart';

import 'package:google_fonts/google_fonts.dart';
void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.exo2TextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: AppColors.textDark,
          displayColor: AppColors.primaryGreen,
        ),
        
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          primary: AppColors.primaryGreen,
          secondary: AppColors.soundPurple,
        ),
      ),
      home: HomePage(),
    );
  }
}