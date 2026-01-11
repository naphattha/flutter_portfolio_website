import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/text_widet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyServicesWidget extends StatefulWidget {
  final Size size;
  const MyServicesWidget({super.key, required this.size});

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  List<bool> _isHovered = [false, false, false];

  @override
  Widget build(BuildContext context) {
    // 1. สร้าง Model ข้อมูลสั้นๆ ไว้ด้านบน Class
    final List<Map<String, String>> servicesData = [
      {
        "title": "Flutter Mobile Development",
        "desc":
            "Developing cross-platform applications with Flutter, focusing on clean architecture and high-performance UI.",
      },
      {
        "title": "Quality & Test Automation",
        "desc":
            "Applying experience from KBTG  to ensure app reliability through automated test scripts and manual QA.",
      },
      {
        "title": "Data-Driven App Solutions",
        "desc":
            "Integrating complex data analysis and visualization into mobile interfaces, powered by Python and SQL background.",
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // ปิดการเลื่อนในตัวเองถ้าอยู่ในหน้าจอหลัก
      itemCount: servicesData.length,
      itemBuilder: (context, index) {
        final item = servicesData[index];
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered[index] = true),
          onExit: (_) => setState(() => _isHovered[index] = false),
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,

            margin: EdgeInsets.symmetric(
              horizontal: widget.size.width * 0.05,
              vertical: 8,
            ),

            width: widget.size.width,
            decoration: BoxDecoration(
              color: _isHovered[index] ? null : Colors.white.withOpacity(0.02),
              borderRadius: BorderRadius.circular(15), // เพิ่มความโค้งเล็กน้อยให้ดูทันสมัย
              border: Border.all(
                color: _isHovered[index]
                    ? AppColors.echoesBright.withOpacity(0.8)
                    : Colors.white10,
              ),
              gradient: _isHovered[index]
                  ? LinearGradient(
                      colors: [AppColors.primaryGreen.withOpacity(0.4),
                       AppColors.soundDeepPurple.withOpacity(0.4)],
                    )
                  : null,
                boxShadow: _isHovered[index] ? [
                BoxShadow(
                  color: AppColors.echoesBright.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ] : [],
            ),
            child: widget.size.width > 600
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(
                        sSize: widget.size,
                        text: "0${index + 1}",
                        size: 28,
                        color: _isHovered[index]
                            ? Colors.white
                            : AppColors.echoesBright,
                        fw: FontWeight.bold,
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: 200,
                        child: TextWidget(
                          sSize: widget.size,
                          text: item['title']!,
                          size: 20,
                          color: Colors.white,
                          fw: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TextWidget(
                          sSize: widget.size,
                          text: item['desc']!,
                          size: 15,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(width: 10),

                      FaIcon(
                        _isHovered[index]
                            ? FontAwesomeIcons.arrowTrendUp
                            : FontAwesomeIcons.circleChevronRight,
                        color: _isHovered[index]
                            ? Colors.white
                            : AppColors.greenCTADark,
                        size: 20,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 20,
                        color: AppColors.echoesBright,
                        fw: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      TextWidget(
                        sSize: widget.size,
                        text: item['title']!,
                        size: 18,
                        color: Colors.white,
                        fw: FontWeight.bold,
                      ),
                      const SizedBox(height: 10),
                      TextWidget(
                        sSize: widget.size,
                        text: item['desc']!,
                        size: 14,
                        color: Colors.white70,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

Widget _buildTechIcon(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.echoesBright.withOpacity(0.2)),
        ),
        child: FaIcon(
          icon,
          color: AppColors.echoesBright,
          size: 30,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        label,
        style: GoogleFonts.montserrat(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}