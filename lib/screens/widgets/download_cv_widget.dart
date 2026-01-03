import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class DownloadCVButton extends StatefulWidget {
  const DownloadCVButton({super.key});

  @override
  State<DownloadCVButton> createState() => _DownloadCVButtonState();
}
class _DownloadCVButtonState extends State<DownloadCVButton> {
  // 1. สร้างสถานะสำหรับการ Hover
  bool _isHovered = false;

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
    return MouseRegion(
      // 2. จับเหตุการณ์เมื่อเมาส์เข้าและออก
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL("https://your-resume-link.pdf"),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 50,
          width: 250,
          // 3. ปรับเปลี่ยนสไตล์ตามสถานะ _isHovered
          decoration: BoxDecoration(
            // เมื่อ Hover ให้สีสว่างขึ้น หรือเปลี่ยนเป็นสีที่ตัดกัน
            color: _isHovered ? AppColors.purpleBorder : AppColors.purpleCTA,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered ? AppColors.primaryGold : AppColors.purpleBorder,
              width: 2,
            ),
          ),

          // 4. เพิ่มการขยับเล็กน้อย (Scale effect)
          transform: _isHovered 
              ? (Matrix4.identity()..scale(1.05)) // ขยายใหญ่ขึ้น 5%
              : Matrix4.identity(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Download my resume",
                style: TextStyle(
                  color: AppColors.primaryGold,
                  fontSize: 14, // ปรับขนาดให้ชัดขึ้นเล็กน้อย
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              FaIcon(
                FontAwesomeIcons.download,
                color: AppColors.primaryGold,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
