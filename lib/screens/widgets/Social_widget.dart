import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

// ฟังก์ชันสำหรับเปิด URL
Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      
      children: [
        // ปุ่ม LinkedIn
        SocialIconItem(
          icon: FontAwesomeIcons.linkedinIn,
          url: "https://www.linkedin.com/in/naphattha-chinaksorn/", // ใส่ลิงก์ของคุณที่นี่
        ),
        const SizedBox(width: 10),
        // ปุ่ม GitHub
        SocialIconItem(
          icon: FontAwesomeIcons.github,
          url: "https://github.com/naphattha", // ใส่ลิงก์ของคุณที่นี่
        ),
      ],
    );
  }
}

class SocialIconItem extends StatefulWidget {
  final IconData icon;
  final String url;

  const SocialIconItem({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  State<SocialIconItem> createState() => _SocialIconItemState();
}

class _SocialIconItemState extends State<SocialIconItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        width: 40,
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.1)) // ขยายขึ้น 10%
            : Matrix4.identity(),
        transformAlignment: Alignment.center, 
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.soundPurple.withOpacity(0.15) : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: _isHovered ? AppColors.echoesBright : AppColors.gray100.withOpacity(0.3),
            width: _isHovered ? 2 : 1,
          ),
        ),
        child: Center(
          child: IconButton(
            // ปิด hoverColor ของ IconButton เพราะเราใช้ AnimatedContainer จัดการแล้ว
            hoverColor: Colors.transparent,
            onPressed: () => _launchURL(widget.url),
            icon: FaIcon(
              widget.icon,
              color: _isHovered ? AppColors.echoesBright : AppColors.gray100,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}

