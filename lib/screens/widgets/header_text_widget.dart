import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_Section.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/download_cv_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HeaderTextWidget extends StatelessWidget {
  final Size size;
  
  const HeaderTextWidget({super.key, required this.size});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.07,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("I am Naphattha",style: TextStyle(fontSize: 35,color: AppColors.primaryGold,fontWeight: FontWeight.bold,fontFamily: 'Mali')),
          GradientText("Web Developer +\nMobile Developer", colors: [
            AppColors.accentPink,
            AppColors.accentDeep
          ],
          style: TextStyle(
            fontSize: size.width*0.045,
            fontFamily: 'Mali',
            fontWeight: FontWeight.bold,
          ),
          
          ),
          SizedBox(
            width: size.width*0.5,
            child: Text("I’m an aspiring mobile developer specializing in Flutter.\nI build mobile applications while continuously learning modern mobile development practices."
            ,style: TextStyle(fontSize: 20,color: AppColors.gray200,fontFamily: 'Mali')),
          ),
          SizedBox(
            width: size.width*0.5,
            child: SocialSection(),
          )        
        ],
      ),
    );
  }
}

class Social_large extends StatelessWidget {
  const Social_large({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: Row(
        children: [
          DownloadCVButton(),
          SizedBox(
            width: 20,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}