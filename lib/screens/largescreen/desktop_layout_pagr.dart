import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/constants/styles.dart';
import 'package:flutter_portfolio_website/screens/widgets/count_container_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/header_text_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/myservice_widgets.dart';
import 'package:flutter_portfolio_website/screens/widgets/rotating_image_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height * 0.1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(children: [HeaderTextWidget(size: size)]),
                        SizedBox(height: 20),
                        Social_large(size: size),
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
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CountWidget(size: size, text1: "0→1", text2: "From", text3: "Learning to Building"),
                    CountWidget(size: size, text1: "Clean", text2: "Code &", text3: "Architecture"),
                    CountWidget(size: size, text1: "Flutter", text2: "State", text3: "Management"),
                    CountWidget(size: size, text1: "Real", text2: "World", text3: "Projects"),
                  ],
                ),
              ),
              SizedBox(height: size.height*0.12,),
              Container(
                color: AppColors.purpleDark,
                padding: EdgeInsets.symmetric(vertical: size.width*0.05),
                child: Column(
                  children: [
                    GradientText( "My Quality Services", colors: [
                      AppColors.goldBorder,
                      AppColors.primaryGold,
                    ],

                  style: TextStyle(
                      fontSize: size.width * 0.030,
                      fontFamily: 'mali',
                      fontWeight: FontWeight.bold),

                    ),
                    SizedBox(height: size.height*0.02,),
                    Text('We put your ideas and thus your wishes in the form of a unique web project that inspires you and you customers.', style: TextStyle(
                        fontSize:size.width*0.012,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),),

                    SizedBox(height: size.height*0.05,),
                    MyServicesWidget(size:size),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
