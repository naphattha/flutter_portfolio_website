import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DownloadCVButton extends StatelessWidget {
  const DownloadCVButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.purpleCTA,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.purpleBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Download CV", style: TextStyle(color: AppColors.primaryGold)),

          const SizedBox.square(dimension: 12),
          FaIcon(
            FontAwesomeIcons.download,
            color: AppColors.primaryGold,
            size: 18,
          ),
        ],
      ),
    );
  }
}
