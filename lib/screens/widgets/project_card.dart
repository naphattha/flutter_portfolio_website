import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/screens/widgets/text_widet.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  
  bool _isHovered=false;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_)=> _onHover(true),
      onExit: (_)=> _onHover(false),

      child: Container(
        height: size.width*0.10,
        width: size.width*0.10,
        decoration: BoxDecoration(
          color: AppColors.accentDeep.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            Container(
              margin:EdgeInsets.all(50),
              child: Image.asset('assets/images/project1.jpg'),

            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                margin: EdgeInsets.all(10),
                curve: Curves.linear,
                duration: Duration(milliseconds: 400),
                height: _isHovered?size.height*0.15:0,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.accentPink
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Expanded(
                          child: Container(
                            child: Center(
                              child: TextWidget(
                                sSize: size,
                                text:"Web developement",
                                color: AppColors.gray100,
                                size:18
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: TextWidget(
                                sSize: size,
                                text:"Click to visit",
                                color: AppColors.gray100,
                                size:18
                              ),
                            ),
                          ),
                        ),


                      ],

                    ),
                    ),
                ),

                ),
 
            )
          ],
        ),
      ),
      
    );
  }

  void _onHover(bool isHovered){
    setState(() {
      _isHovered=isHovered;
    });
  }
}