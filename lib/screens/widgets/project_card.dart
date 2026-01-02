import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/text_widet.dart';

import 'package:url_launcher/url_launcher.dart';

// 1. รับข้อมูล Project ผ่าน Constructor
class ProjectCard extends StatefulWidget {
  final dynamic project; // เปลี่ยนเป็น Project project ถ้าคุณสร้าง Class Model ไว้แล้ว
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  // ฟังก์ชันสำหรับเปิด URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(widget.project.projectUrl),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _isHovered ? (Matrix4.identity()..translate(0, -10, 0)..scale(1.025)) : Matrix4.identity(),
          decoration: BoxDecoration(
            color: AppColors.accentDeep.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
            boxShadow: _isHovered 
              ? [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10))] 
              : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                // --- เลเยอร์ที่ 1: รูปภาพโปรเจกต์ ---
                Positioned.fill(
                  child: Image.asset(
                    widget.project.image,
                    fit: BoxFit.cover,
                  ),
                ),

                // --- เลเยอร์ที่ 2: Gradient พื้นหลัง (ช่วยให้ตัวหนังสืออ่านง่ายขึ้น) ---
                Positioned.fill(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isHovered ? 0.9 : 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.purpleDark.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // --- เลเยอร์ที่ 3: ข้อมูล Tags และปุ่ม (แสดงตอน Hover) ---
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    height: _isHovered ? size.height * 0.15 : 0, // ปรับความสูงตามความเหมาะสม
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.purpleDark.withOpacity(0.8), // เพิ่มพื้นหลังให้ชัดขึ้น
                    ),
                    child: SingleChildScrollView( // สวนนี้จะช่วยแก้ปัญหา Overflow
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // ใช้พื้นที่เท่าที่จำเป็น
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ชื่อโปรเจกต์ (โชว์ตลอดเวลา)
                          TextWidget(
                            sSize: size,
                            text: widget.project.title,
                            color: Colors.white,
                            size: 18,
                            fw: FontWeight.bold,
                          ),
                          
                          const SizedBox(height: 8),

                          // ใช้ AnimatedOpacity เพื่อให้ Tags ค่อยๆ จางขึ้นมา
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: _isHovered ? 1.0 : 0.0,
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: widget.project.tags.map<Widget>((tag) => 
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentPink.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ).toList(),
                            ),
                          ),

                          if (_isHovered) const SizedBox(height: 10),

                          // ข้อความ Click (โชว์เฉพาะตอน Hover)
                          if (_isHovered)
                            const Center(
                              child: Icon(Icons.open_in_new, color: Colors.white, size: 20),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}

class Project {
  final String title;
  final String category; 
  final List<String> tags;
  final String image;
  final String description;
  final String projectUrl;

  Project({
    required this.title, 
    required this.category, 
    required this.tags, 
    required this.image,
    required this.description,
    required this.projectUrl,
  });
}

// ข้อมูลโปรเจกต์ของคุณ (เพิ่ม-ลดตรงนี้ได้เลย)
List<Project> myProjectsData = [
  Project(
    title: "E-Commerce App",
    category: "Mobile",
    tags: ["Flutter", "Firebase", "Stripe"],
    image: "assets/images/project1.png",
    description: "แอปซื้อขายสินค้าออนไลน์...",
    projectUrl:"https://github.com/naphattha/flutter_portfolio_website",
  ),
  Project(
    title: "Portfolio Website",
    category: "Web",
    tags: ["Flutter Web", "Responsive"],
    image: "assets/images/project1.png",
    description: "เว็บไซต์พอร์ตโฟลิโอส่วนตัว...",
    projectUrl:"https://github.com/naphattha/flutter_portfolio_website",
  ),
  Project(
    title: "Food Delivery UI",
    category: "Other",
    tags: ["Figma", "UX/UI"],
    image: "assets/images/project1.png",
    description: "ออกแบบหน้าจอแอปส่งอาหาร...",
    projectUrl:"https://github.com/naphattha/flutter_portfolio_website",
  ),
];