import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class NavbarWidget extends StatelessWidget {
  final Size size;
  final Function(int) onMenuTap; 

  const NavbarWidget({super.key, required this.size, required this.onMenuTap});
    // ฟังก์ชันสำหรับเปิด URL
    Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
    }

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // เอฟเฟกต์เบลอหลังคา
        child: Container(
          width: size.width,
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          decoration: BoxDecoration(
            color: AppColors.purpleDark.withOpacity(0.7), // สีพื้นหลังโปร่งแสง
            border: const Border(
              bottom: BorderSide(color: Colors.white10, width: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click, // บังคับให้เป็นรูปมือ
                child:
                  GestureDetector(
                    onTap: () => onMenuTap(-1),
                    child:RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "NAPHATTHA",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: "CHINAKSORN",
                            style: GoogleFonts.montserrat(
                              color: AppColors.primaryGold,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ),

              // Menu Items (สำหรับ Desktop)
              if (size.width > 600)
                Row(
                  children: [
                    _navItem("Services", 0),
                    _navItem("Projects", 1),
                    _navItem("Contact", 2),
                    const SizedBox(width: 20),
                    // ปุ่ม Highlight เล็กๆ แบบ GitHub Style
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _launchURL("https://your-resume-link.pdf"),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryGold),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "Resume",
                            style: GoogleFonts.montserrat(
                              color: AppColors.primaryGold,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                const Icon(Icons.menu, color: Colors.white), // สำหรับ Mobile
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: InkWell( // ใช้ InkWell เพื่อให้กดได้และมี Effect
        onTap: () => onMenuTap(index),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            color: Colors.white70,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}