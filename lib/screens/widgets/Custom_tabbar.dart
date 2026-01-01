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
      width: isMobile ? size.width * 0.9 : size.width * 0.36,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.amber),
          color: AppColors.purpleDark,
          borderRadius: BorderRadius.circular(20)
        ),
        child: TabBar(
          controller: tabController,
          dividerColor: AppColors.accentDeep,
          isScrollable: isMobile,
          tabs: [
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
  const CustomTabView({super.key,required this.tabController});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SizedBox(
      // ต้องกำหนดความสูงให้ TabBarView (เช่น 800 หรือคำนวณตามจำนวนโปรเจกต์)
      height: size.height * 0.8, 
      child: TabBarView(
        controller: tabController,
        children: [
          // ส่งค่า categoryFilter ให้ตรงกับชื่อที่เราจะใช้กรองใน myProjectsData
          Allprojects(size: size, categoryFilter: "All"),
          Allprojects(size: size, categoryFilter: "Web"),
          Allprojects(size: size, categoryFilter: "Mobile"),
          Allprojects(size: size, categoryFilter: "Other"),
        ],
      ),
    );
  }
}

class Allprojects extends StatelessWidget {
  final Size size;
  final String categoryFilter;

  const Allprojects({super.key, required this.size, required this.categoryFilter});

  @override
  Widget build(BuildContext context) {
    // กรองข้อมูล: ถ้าเลือก 'All' ให้เอาหมด ถ้าไม่ใช่ให้เอาเฉพาะที่ตรงหมวด
    List<Project> filteredProjects = categoryFilter == "All" 
        ? myProjectsData 
        : myProjectsData.where((p) => p.category == categoryFilter).toList();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width < 600 ? 10 : size.width * 0.1),
      padding: const EdgeInsets.all(20),
      child: filteredProjects.isEmpty 
        ? const Center(child: Text("No projects found")) // กรณีไม่มีโปรเจกต์ในหมวดนั้น
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProjects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size.width < 650 ? 1 : size.width < 1100 ? 2 : 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              return ProjectCard(project: filteredProjects[index]);
            },
          ),
    );
  }
}