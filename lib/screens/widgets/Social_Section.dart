import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/download_cv_widget.dart';


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
            
            DownloadCVButton(),
            const SizedBox(width: 20,),

            Expanded(child: SocialWidget())
          
          ],
        ),
    );
  }
}