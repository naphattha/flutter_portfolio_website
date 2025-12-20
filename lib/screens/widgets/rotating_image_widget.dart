import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';

import 'dart:math' as math;


class RotatingImageContainer extends StatefulWidget {
  const RotatingImageContainer({super.key});

  @override
  State<RotatingImageContainer> createState() => _RotatingImageContainerState();
}

class _RotatingImageContainerState extends State<RotatingImageContainer> {
  
   bool isHovered=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return MouseRegion(
      
      onEnter: (_)=>setState(()=>isHovered=true),
      onExit: (_)=>setState(()=>isHovered=false),
      
      child: AnimatedContainer(
        
        duration: Duration(milliseconds: 200),
        transform: Matrix4.rotationZ(isHovered ?0:math.pi/36),
        
        height: size.width*0.2,
        width: size.width*0.2,
        
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/Naphattha.jpg')
          ),
          
          border: Border.all(color: AppColors.hoverEffect,width: 1.2),
          borderRadius: BorderRadius.circular(20)
        ),
        
      ),
      
    );
  }
}