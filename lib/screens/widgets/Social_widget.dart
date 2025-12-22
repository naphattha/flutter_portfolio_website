import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.purpleDark.withValues()),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.gray600,
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: AppColors.purpleDark,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.purpleDark.withValues()),
          ),
          child: Center(
            child: IconButton(
              hoverColor: AppColors.gray600,
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.github,
                color: AppColors.purpleDark,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
