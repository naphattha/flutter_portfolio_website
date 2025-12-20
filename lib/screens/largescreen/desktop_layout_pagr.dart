import 'package:flutter/material.dart';
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
            Container(
                margin: EdgeInsets.symmetric( vertical: size.height * 0.1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Row(
                        children: [
                          HeaderTextWidget(size:size,),
                          
                          
                        ],
                      ),
                      SizedBox(height: 20,),
                      Social_large(size: size),
                      ],
                      ),
                      Expanded(child: Container(
                       
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
            )
          ],)
        )
      )
    );
  }
}