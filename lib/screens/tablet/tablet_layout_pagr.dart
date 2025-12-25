import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/constants/styles.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/count_container_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/download_cv_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/header_text_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/myservice_widgets.dart';
import 'package:flutter_portfolio_website/screens/widgets/rotating_image_widget.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,

        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.1),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(children: [HeaderTextWidget(size: size)]),
                        SizedBox(height: 20),
                        Social_Tab(size: size),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [RotatingImageContainer()],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CountWidget(size: size, text1: "0→1", text2: "From", text3: "Learning to Building"),
                      const SizedBox(height: 10,),
                      Divider(
                        color: AppColors.gray600,
                        indent: size.width*0.05,
                        endIndent: size.width*0.05,
                      ),
                      CountWidget(size: size, text1: "Clean", text2: "Code &", text3: "Architecture"),
                      const SizedBox(height: 10,),
                      Divider(
                        color: AppColors.gray600,
                        indent: size.width*0.05,
                        endIndent: size.width*0.05,
                      ),
                      CountWidget(size: size, text1: "Flutter", text2: "State", text3: "Management"),
                      const SizedBox(height: 10,),
                      Divider(
                        color: AppColors.gray600,
                        indent: size.width*0.05,
                        endIndent: size.width*0.05,
                      ),
                      CountWidget(size: size, text1: "Real", text2: "World", text3: "Projects"),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                MyServicesWidget(size: size),
             ],
            ),
          ),
        ),
      ),
    );
  }
}

class Social_Tab extends StatelessWidget {
  const Social_Tab({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [DownloadCVButton(), SizedBox(height: 10), SocialWidget()],
      ),
    );
  }
}
