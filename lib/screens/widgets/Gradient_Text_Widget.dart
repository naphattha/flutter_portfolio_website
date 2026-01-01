import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:google_fonts/google_fonts.dart';
class GradientTextWidget extends StatelessWidget {
  final TextAlign? alignment;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  final double? fsize;
  final FontWeight? fw;
  const GradientTextWidget(
      {super.key,
      required this.size,
      this.alignment,
      this.fw,
      this.color1,
      this.text1,
      this.text2,
      this.color2,
      this.fsize});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      textAlign: size.width < 600 && alignment != null ? alignment : null,
      "${text1}\n${text2??""}",
      colors: [
        AppColors.accentPink,
        AppColors.accentDeep,
      ],
      style: GoogleFonts.montserrat(
          fontSize: size.width * 0.040,
          fontWeight: FontWeight.bold),
    );
  }
}