import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/screens/largescreen/desktop_layout_pagr.dart';
import 'package:flutter_portfolio_website/screens/mobile/mobile_layout_pagr.dart';
import 'package:flutter_portfolio_website/screens/tablet/tablet_layout_pagr.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          return DesktopLayout();
        } else if (constraints.maxWidth > 450) {
          return TabletLayout();
        } else {
          return MobileLayout();
        }
      },
    );
  }
}
