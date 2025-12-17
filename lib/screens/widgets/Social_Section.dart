import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: AppColors.purpleCTA,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.purpleBorder)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("download Resume",style: TextStyle(color: AppColors.primaryGold,fontWeight: FontWeight.bold),),

                  const SizedBox.square(dimension: 12,),
                  FaIcon(FontAwesomeIcons.download,color: AppColors.primaryGold,size: 18,)
                ],

              ),
            ),

            const SizedBox(width: 20,),

            Expanded(child: SocialWidget())
          
          ],
        ),
    );
  }
}