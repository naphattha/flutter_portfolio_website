import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/constants/colors.dart';
import 'package:flutter_portfolio_website/constants/styles.dart';
import 'package:flutter_portfolio_website/screens/widgets/header_text_widget.dart';
import 'package:flutter_portfolio_website/screens/widgets/rotating_image_widget.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,

        child: SingleChildScrollView(
          child: Column(
            children: [
            
            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [Row(
                      children: [
                        HeaderTextWidget(size:size,)
                      ],
                    )],
                    ),
                    Expanded(child: Container(
                      height: size.height*0.75,
                      child: Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotatingImageContainer()
                        ],
                      ),
                    ))
                ],
            )
          
          ],)
        )
      )
    );
  }
}