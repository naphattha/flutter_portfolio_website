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
    return Container(
      width: size.width*0.36,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.amber),
          color: AppColors.purpleDark,
          borderRadius: BorderRadius.circular(20)
        ),
        child: TabBar(
          controller: tabController,
          dividerColor: AppColors.accentDeep,
          tabs: [
            Tab(text: "All",),
            Tab(text: "Apps",),
            Tab(text: "Branding",),
            Tab(text: "UX/UI",),
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
    return TabBarView(
      controller: tabController,
      children: [
        Allprojects(size: size,),
        Allprojects(size: size,),
        Allprojects(size: size,),
        Allprojects(size: size,),
      ]
    
    );
  }
}

class Allprojects extends StatelessWidget {
  final Size size;
  const Allprojects({super.key,required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width*0.1),
      padding: EdgeInsets.all(20),
      child: GridView(
        children: [
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
          ProjectCard(),
        ],  
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3/3,
          ),

        ),
    );
    
  }
}