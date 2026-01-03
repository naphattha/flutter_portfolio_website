import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/text_widet.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => isMobile ? null : _onHover(true),
      onExit: (_) => isMobile ? null : _onHover(false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: 'Click to view project',
        verticalOffset: 20,
        preferBelow: true,
        child:GestureDetector(
          onTap: () => _launchURL(widget.project.projectUrl),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: _isHovered && !isMobile
                ? (Matrix4.identity()..translate(0, -10, 0)..scale(1.025)) 
                : Matrix4.identity(),
            decoration: BoxDecoration(
              color: AppColors.accentDeep.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
              boxShadow: _isHovered && !isMobile
                ? [
                    BoxShadow(
                      color: AppColors.primaryGold.withOpacity(0.4), // ใช้สีทองจางๆ 
                      blurRadius: 20,
                      spreadRadius: 5, // เพิ่มรัศมีการกระจายเพื่อให้เห็นเงาแม้พื้นหลังสว่าง
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // เพิ่มเงาสีดำซ้อนอีกชั้นเพื่อความคมชัด
                      blurRadius: 10,
                      spreadRadius: -2,
                    )
                  ]
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
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.purpleDark,
                        child: const Icon(Icons.image_not_supported, color: Colors.white24),
                      ),
                    ),
                  ),

                  // --- เลเยอร์ที่ 2: Gradient พื้นหลัง (ช่วยให้ตัวหนังสืออ่านง่ายขึ้น) ---
                  Positioned.fill(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isMobile ? 0.8 : (_isHovered ? 0.9 : 0.4),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.purpleDark.withOpacity(0.4), // เริ่มเข้มจากกลางภาพ
                              AppColors.purpleDark.withOpacity(0.9), // เข้มมากตรงส่วนล่าง
                              Colors.black,
                            ],
                            stops: const [0.0, 0.4, 0.8, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // --- เลเยอร์ที่ 3: ข้อมูล Tags และปุ่ม (แสดงตอน Hover) ---
                  // Layer 3: Info
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryGold,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.project.category,
                            style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.project.title,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.8), // เงาสีดำหลังตัวอักษร
                                offset: const Offset(1, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),

                        if (isMobile) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.project.description,
                          maxLines: 1, // มือถือบรรทัดเดียวพอ กันทะลุขอบ
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        ] 
                        else ...[// Animated Detail Section
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            child: _isHovered 
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      widget.project.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    const SizedBox(height: 12),
                                    Wrap(
                                      spacing: 6,
                                      runSpacing: 6,
                                      children: widget.project.tags.map<Widget>((tag) => Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.white30),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(tag, style: const TextStyle(color: Colors.amberAccent, fontSize: 10)),
                                      )).toList(),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                            ),
                        ],
                      ]
                      ),
                    ),
                ],
              ),
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
  // --- MOBILE SECTION (In Progress) ---
  Project(
    title: "E-Commerce App",
    category: "Mobile",
    tags: ["Flutter", "Firebase", "Stripe"],
    image: "assets/images/project1.png",
    description: "Full-stack mobile commerce solution (Under Development).",
    projectUrl: "https://github.com/naphattha",
  ),

  // --- WEB SECTION ---
  Project(
    title: "Portfolio Website",
    category: "Web",
    tags: ["Flutter Web", "Responsive", "Glassmorphism"],
    image: "assets/images/project1.png", // เปลี่ยนที่อยู่รูปตามจริง
    description: "Personal portfolio built with Flutter Web featuring smooth animations and sticky navigation.",
    projectUrl: "https://github.com/naphattha/flutter_portfolio_website",
  ),
  // --- OTHER SECTION (Highlight) ---
  Project(
    title: "LLM-RAG Financial QA",
    category: "Other",
    tags: ["Python", "Neo4j", "SQL", "LLM"],
    image: "assets/images/project1.png", // แนะนำให้ใช้รูป Graph Database สวยๆ
    description: "Financial Knowledge Graph & RAG-powered chatbot for SET50 data analysis using Neo4j and MySQL.",
    projectUrl: "https://github.com/naphattha", // ใส่ลิงก์ Github ของโปรเจกต์นี้
  ),
];