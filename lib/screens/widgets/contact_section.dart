import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/Social_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // ฟังก์ชันสำหรับเปิดลิงก์ (Email, Phone, Maps)
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw Exception('Could not launch $url');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: AppColors.purpleDark, // สีพื้นหลังหลักของคุณ
      child: Column(
        children: [
          // หัวข้อเล็กๆ
          Text(
            "Get In Touch",
            style: TextStyle(
              color: AppColors.primaryGold,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),

          // รายการข้อมูลติดต่อ (Location, Email, Phone)
          Wrap(
            spacing: 40, // ระยะห่างแนวนอน
            runSpacing: 25, // ระยะห่างแนวตั้ง (ตอนจอเล็ก)
            alignment: WrapAlignment.center,
            children: [
              _buildContactItem(
                icon: Icons.location_on_rounded,
                label: "Location",
                value: "Bangkok , Thailand",
                onTap: () => _launchURL("https://maps.google.com/?q=Bangkok"),
              ),
              _buildContactItem(
                icon: Icons.email_rounded,
                label: "Email",
                value: "naphatthachinaksorn@gmail.com",
                onTap: () => _launchURL("mailto:naphatthachinaksorn@gmail.com"),
              ),
              _buildContactItem(
                icon: Icons.phone_android_rounded,
                label: "Phone",
                value: "+66 82 540 6419",
                onTap: () => _launchURL("tel:+66825406419"),
              ),
            ],
          ),

          const SizedBox(height: 50),
          
          // Social Widget ที่ทำไว้แล้ว
          const SocialWidget(),

          const SizedBox(height: 40),
          const Divider(color: Colors.white10, indent: 50, endIndent: 50),
          const SizedBox(height: 20),

          // Footer เล็กๆ
          Text(
            "© 2026 Naphattha Chinaksorn. Built with Flutter",
            style: TextStyle(color: AppColors.gray600, fontSize: 11),
          ),
        ],
      ),
    );
  }

  // Widget ช่วยสร้างรายการติดต่อแต่ละอัน
  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryGold, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}