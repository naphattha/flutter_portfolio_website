import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';

class CustomTabbar extends StatelessWidget {
  final TabController tabController;
  const CustomTabbar({super.key,required this.tabController});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width*0.36,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.black),
          color: AppColors.accentDeep,
          borderRadius: BorderRadius.circular(20)
        ),
        child: TabBar(
          tabs: [
            Tab(text: "All",),
            Tab(text: "Apps",),
            Tab(text: "Branding",),
            Tab(text: "UX/UI",),
            ],
        ),
      );
  }
}

class CustomTabView extends StatelessWidget {
  final TabController tabController;
  const CustomTabView({super.key,required this.tabController});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}