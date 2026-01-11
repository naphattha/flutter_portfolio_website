import 'package:flutter/painting.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';

class Styles {
  static const BoxDecoration gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.bgGreenSoft,
        AppColors.bgGreenMid,
        AppColors.bgGreenDark,
      ],
    ),
  );

  // เพิ่ม Gradient พิเศษสำหรับปุ่มหรือชื่อที่ต้องการความโดดเด่นแบบ JoJo
  static const BoxDecoration PowerGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primaryGreen,
        AppColors.echoesBright,
      ],
    ),
  );
}