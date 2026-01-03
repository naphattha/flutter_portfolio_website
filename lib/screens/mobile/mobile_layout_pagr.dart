import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/constants/styles.dart';
import 'package:flutter_portfolio_website/screens/tablet/tablet_layout_pagr.dart';
import 'package:flutter_portfolio_website/screens/widgets/custom_tabbar.dart';
import 'package:flutter_portfolio_website/screens/widgets/Gradient_Text_Widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/count_container_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/header_text_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/myservice_widgets.dart';
import 'package:flutter_portfolio_website/screens/widgets/rotating_image_widget.dart';

import 'package:google_fonts/google_fonts.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  
  @override
  void initState() {
    
    _tabController=TabController(length: 4, vsync: this);
    
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [RotatingImageContainer()],
                          ),
                        ),
                        SizedBox(height: 20),

                        Row(children: [HeaderTextWidget(size: size)]),
                        SizedBox(height: 20),
                        Social_Tab(size: size),
                      ],
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
                SizedBox(
                  height: size.width * 0.09,
                ),
                
                MyServicesWidget(size: size),
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: size.width*0.05),

                  child: Column(
                    children: [
                      GradientTextWidget(size: size,text1:'My Recent Works.'),
                      SizedBox(height: size.height*0.06,),
                      CustomTabbar(tabController: _tabController,)
                      ],
                    ),
                  ),
                  Container(
                    height: size.height,
                    child: CustomTabView(tabController: _tabController,),
                  )

              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
