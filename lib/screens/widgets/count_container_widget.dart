import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
class CountWidget extends StatelessWidget {
  final Size size;
  final String text1;
  final String text2;
  final String text3;
  const CountWidget({super.key,required this.size,required this.text1, required this.text2, required this.text3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


        Text("${text1}",style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: size.width*0.032
        ),),

        SizedBox(width: 10,),

        Text("${text2}\n${text3}",style: GoogleFonts.montserrat(color: Colors.white,fontSize: size.width*0.014),)
      ],
    );
  }
}