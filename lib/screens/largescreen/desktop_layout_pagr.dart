import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/constants/styles.dart';
import 'package:flutter_portfolio_website/screens/widgets/contact_section.dart';
import 'package:flutter_portfolio_website/screens/widgets/custom_tabbar.dart';
import 'package:flutter_portfolio_website/screens/widgets/Gradient_Text_Widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/count_container_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/header_text_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/myservice_widgets.dart';
import 'package:flutter_portfolio_website/screens/widgets/navbar_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/rotating_image_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/technical_skills_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'package:google_fonts/google_fonts.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _worksKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

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

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Styles.gradientDecoration,

            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // ใส่ Key ให้กับแต่ละส่วน
                  Container(key: _headerKey, child: const SizedBox(height: 20)),
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
                    key: _servicesKey,
                    color: AppColors.purpleDark,
                    padding: EdgeInsets.symmetric(vertical: size.width*0.05),
                    child: Column(
                      children: [
                        GradientText( "My Professional Focus", colors: [
                          AppColors.goldBorder,
                          AppColors.primaryGold,
                        ],
                      style: GoogleFonts.montserrat(
                          fontSize: size.width * 0.030,
                          fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.15), // เพิ่ม padding ไม่ให้ตัวหนังสือชิดขอบไป
                          child:Text('Bridging the gap between robust back-end logic and intuitive mobile experiences, ensuring every line of code meets industry standards for quality and security.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize:size.width*0.012,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70.withOpacity(0.8),
                              height: 1.5
                          ),),
                        ),

                        SizedBox(height: size.height*0.05,),
                        MyServicesWidget(size:size),
                        SizedBox(height: size.height * 0.1), // ระยะห่างก่อนถึงส่วน Skills

                        TechnicalSkillsWidget(size: size),
                      ],
                    ),
                  ),

                  Container(
                    key: _worksKey,
                    width: size.width,
                    padding: EdgeInsets.symmetric(vertical: size.width*0.05),

                    child: Column(
                      children: [
                        GradientTextWidget(size: size,text1:'My Recent Projects'),
                        CustomTabbar(tabController: _tabController,)
                      ],
                    ),
                  ),
                  CustomTabView(tabController: _tabController,),
                  Container(key: _contactKey, child: ContactSection()),

                ],
              ),
            ),
          ),
          Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: NavbarWidget(
              size: size,
              onMenuTap: (index) {
                if (index == -1) _scrollToSection(_headerKey);
                if (index == 0) _scrollToSection(_servicesKey);
                if (index == 1) _scrollToSection(_worksKey);
                if (index == 2) _scrollToSection(_contactKey);
              },
            ),
        ),
        ]
      ),
    );
  }
}
