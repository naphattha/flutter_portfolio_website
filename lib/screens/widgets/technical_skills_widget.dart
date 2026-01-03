import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

class TechnicalSkillsWidget extends StatelessWidget {
  final Size size;
  const TechnicalSkillsWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    // ดึงข้อมูลจาก Resume ของคุณ
    final List<Map<String, dynamic>> techSkills = [
      {"name": "Flutter", "icon": FontAwesomeIcons.flutter},
      {"name": "Dart", "icon": FontAwesomeIcons.code},
      {"name": "Python", "icon": FontAwesomeIcons.python},
      {"name": "SQL", "icon": FontAwesomeIcons.database},
      {"name": "Git", "icon": FontAwesomeIcons.gitAlt},
      {"name": "Java", "icon": FontAwesomeIcons.java},
      {"name": "Robot Framework", "icon": FontAwesomeIcons.robot},
      {"name": "Node.js", "icon": FontAwesomeIcons.nodeJs},
    ];

    return Column(
      children: [
        Text(
          "Technologies & Tools",
          style: GoogleFonts.montserrat(
            fontSize: size.width > 600 ? 26 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 3,
          color: AppColors.primaryGold,
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: size.width * 0.8,
          child: Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: techSkills.map((skill) => TechCard(skill: skill)).toList(),
          ),
        ),
      ],
    );
  }
}

// แยก Widget ย่อยสำหรับแต่ละ Icon เพื่อทำ Hover Effect
class TechCard extends StatefulWidget {
  final Map<String, dynamic> skill;
  const TechCard({super.key, required this.skill});

  @override
  State<TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<TechCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: isHovered 
                    ? AppColors.primaryGold.withOpacity(0.1) 
                    : Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isHovered ? AppColors.primaryGold : Colors.white10,
                  width: 2,
                ),
                boxShadow: isHovered ? [
                  BoxShadow(
                    color: AppColors.primaryGold.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  )
                ] : [],
              ),
              child: FaIcon(
                widget.skill['icon'],
                color: isHovered ? AppColors.primaryGold : Colors.white70,
                size: 32,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.skill['name'],
              style: GoogleFonts.poppins(
                color: isHovered ? AppColors.primaryGold : Colors.white60,
                fontSize: 13,
                fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}