import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/Gradient_Text_Widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/download_cv_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/text_widet.dart';


class HeaderTextWidget extends StatelessWidget {
  final Size size;

  const HeaderTextWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: Column(
        crossAxisAlignment: size.width > 600
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
                sSize: size,
                text: "I am Naphattha Chinaksorn",
                color: AppColors.echoesBright,
                size: 26,
                fw: FontWeight.bold,
                alignment: size.width > 600 ? TextAlign.start : TextAlign.center,
          ),
          GradientTextWidget(
            size: size,
            alignment: size.width > 600 ? TextAlign.start : TextAlign.center,
            text1: "Flutter Developer",
            text2: "Mobile App Developer",
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: size.width > 600 ? size.width * 0.5 : size.width * 0.9,
            child:  TextWidget(
                sSize: size,
                alignment: size.width > 600 ? TextAlign.start : TextAlign.center,
                text:
                     "A Computer Science graduate with a passion for building high-quality, secure mobile applications. Leveraging my experience in QA and Data Analysis to deliver exceptional user experiences.",
                size: 16,
                color: Colors.white70,
                fw: FontWeight.normal),
            )
          ],
        ),
      );
  }
}

class Social_large extends StatelessWidget {
  const Social_large({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: Row(
        children: [DownloadCVButton(), SizedBox(width: 20), SocialWidget()],
      ),
    );
  }
}
