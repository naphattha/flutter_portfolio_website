import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/constants/styles.dart';
import 'package:flutter_portfolio_website/screens/tablet/tablet_layout_pagr.dart';
import 'package:flutter_portfolio_website/screens/widgets/contact_section.dart';
import 'package:flutter_portfolio_website/screens/widgets/custom_tabbar.dart';
import 'package:flutter_portfolio_website/screens/widgets/Gradient_Text_Widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/count_container_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/header_text_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/myservice_widgets.dart';
import 'package:flutter_portfolio_website/screens/widgets/rotating_image_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/technical_skills_widget.dart';

import 'package:google_fonts/google_fonts.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> with SingleTickerProviderStateMixin{

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
      // แนะนำให้เพิ่ม Drawer สำหรับ Mobile Menu
      endDrawer: Drawer(
        backgroundColor: AppColors.purpleDark,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Center(child: Text("MENU", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)))),
            _buildDrawerItem("Home", () => _scrollToSection(_headerKey)),
            _buildDrawerItem("Services", () => _scrollToSection(_servicesKey)),
            _buildDrawerItem("Works", () => _scrollToSection(_worksKey)),
            _buildDrawerItem("Contact", () => _scrollToSection(_contactKey)),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.purpleDark,
        elevation: 0,
        title: const Text("My Portfolio", style: TextStyle(color: AppColors.primaryGold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,

        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: Column(
              children: [
                // --- SECTION: HEADER ---
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: Column(
                    children: [
                      RotatingImageContainer(), // รูปภาพอยู่บน
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeaderTextWidget(size: size), // ข้อความอยู่ล่าง
                      ),
                      const SizedBox(height: 20),
                      Social_Tab(size: size),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                // --- SECTION: COUNTER/STATS ---
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: Column(
                    children: [
                      _mobileCountItem(size*1.5, "0→1", "From Learning", "to Building"),
                      _mobileCountItem(size*1.5, "Clean", "Code &", "Architecture"),
                      _mobileCountItem(size*1.5, "Flutter", "State", "Management"),
                      _mobileCountItem(size*1.5, "Real", "World", "Projects"),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * 0.09,
                ),
                
                // --- SECTION: SERVICES & SKILLS ---
                Container(
                  key: _servicesKey,
                  width: double.infinity,
                  color: AppColors.purpleDark.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "My Professional Focus",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: AppColors.primaryGold,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Bridging the gap between back-end logic and intuitive mobile experiences.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 40),
                      MyServicesWidget(size: size),
                      const SizedBox(height: 50),
                      Transform.scale(
                        scale: 0.8, 
                        child: TechnicalSkillsWidget(size: size),
                      )
                    ],
                  ),
                ),

                // --- SECTION: WORKS ---
                Container(
                key: _worksKey,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
                child: Column(
                  children: [
                    GradientTextWidget(size: size, text1: 'My Recent Projects'),
                    const SizedBox(height: 15),

                    Transform.scale(
                      scale: 0.8, 
                      child: CustomTabbar(tabController: _tabController),
                    ),
                    const SizedBox(height: 10),
                    CustomTabView(tabController: _tabController),
                  ],
                ),
              ),
              // --- SECTION: CONTACT ---
              Container(
                key: _contactKey,
                child: const ContactSection(),
              ),

              ],
            ),
          ),
          
        ),
      ),
    );
  }

  // Helper สำหรับสร้าง Count Item พร้อมเส้นคั่น
  Widget _mobileCountItem(Size size, String t1, String t2, String t3) {
    return Column(
      children: [
        CountWidget(size: size, text1: t1, text2: t2, text3: t3),
        Divider(color: AppColors.gray600.withOpacity(0.3), height: 30),
      ],
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context); // ปิด Drawer
        onTap();
      },
    );
  }
}

