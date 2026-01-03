import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/project_card.dart';
import 'package:flutter_portfolio_website/screens/widgets/text_widet.dart';

class CustomTabbar extends StatelessWidget {
  final TabController tabController;
  const CustomTabbar({super.key,required this.tabController});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    bool isMobile = size.width < 600;

    return Container(
      width: isMobile ? size.width * 0.7 : size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.amber),
          color: AppColors.purpleDark,
          borderRadius: BorderRadius.circular(isMobile ? 12 : 20)
        ),
        child: TabBar(
          controller: tabController,
          isScrollable: isMobile,
          physics: const BouncingScrollPhysics(),
          tabs: const [
            Tab(text: "All",),
            Tab(text: "Web",),
            Tab(text: "Mobile",),
            Tab(text: "Other",),
          ],
          indicator: BoxDecoration(
            color: AppColors.purpleSoft,
            borderRadius: BorderRadius.circular(20),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          labelColor: AppColors.gray100,
          unselectedLabelColor: AppColors.gray600,
          labelPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
      );
  }
}

class CustomTabView extends StatelessWidget {
  final TabController tabController;
  const CustomTabView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool isMobile = size.width < 600;

    // หากเป็น Mobile ให้ใช้ Column เพื่อให้ไหลตาม Scroll หลัก
    if (isMobile) {
      return AnimatedBuilder(
        animation: tabController,
        builder: (context, child) {
          // เลือกดึงข้อมูลตาม Index ที่ TabController เลือกอยู่
          String currentCategory = _getCategoryByIndex(tabController.index);
          return Allprojects(size: size, categoryFilter: currentCategory);
        },
      );
    }

    // หากเป็น Desktop ให้ใช้ TabBarView เหมือนเดิม
    return SizedBox(
      height: size.height * 0.8,
      child: TabBarView(
        controller: tabController,
        children: [
          Allprojects(size: size, categoryFilter: "All"),
          Allprojects(size: size, categoryFilter: "Web"),
          Allprojects(size: size, categoryFilter: "Mobile"),
          Allprojects(size: size, categoryFilter: "Other"),
        ],
      ),
    );
  }

  // Helper สำหรับแปลง Index เป็นชื่อหมวด
  String _getCategoryByIndex(int index) {
    switch (index) {
      case 1: return "Web";
      case 2: return "Mobile";
      case 3: return "Other";
      default: return "All";
    }
  }
}

class Allprojects extends StatelessWidget {
  final Size size;
  final String categoryFilter;

  const Allprojects({super.key, required this.size, required this.categoryFilter});

  @override
  Widget build(BuildContext context) {
    bool isMobile = size.width < 600;

    // กรองข้อมูล: ถ้าเลือก 'All' ให้เอาหมด ถ้าไม่ใช่ให้เอาเฉพาะที่ตรงหมวด
    List<Project> filteredProjects = categoryFilter == "All" 
        ? myProjectsData 
        : myProjectsData.where((p) => p.category == categoryFilter).toList();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width < 600 ? 15 : size.width * 0.1),
      padding: EdgeInsets.all(isMobile? 10 : 20),
      child: filteredProjects.isEmpty 
        ? const Center(child: Text("No projects found")) // กรณีไม่มีโปรเจกต์ในหมวดนั้น
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProjects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width < 600 ? 1 : (size.width < 1024 ? 2 : 3),
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.5 : 1.1,
            ),
            itemBuilder: (context, index) {
              return ProjectCard(project: filteredProjects[index]);
            },
          ),
    );
  }
}