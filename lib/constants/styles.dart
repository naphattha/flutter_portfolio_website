import 'package:flutter/painting.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';

class Styles{
  static const BoxDecoration gradientDecoration = BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.purpleSoft,
              AppColors.purpleMid,
              AppColors.purpleDark,
              ]
          )
  );
}