import 'package:flutter/material.dart';

class AppColors {
  // PRIMARY COLORS
  static const Color primaryGreen = Color(0xFF00695C); // เขียวเข้ม
  static const Color primaryLight = Color(0xFFE8F5E9); // เขียวอ่อนมากสำหรับพื้นหลังสว่าง
  static const Color primaryDark = Color(0xFF004D40);  // เขียวเข้มจัดสำหรับ Shadow/Hover

  // ACCENT COLORS
  static const Color echoesBright = Color(0xFF00E676); // เขียวสว่าง
  static const Color soundPurple = Color(0xFF6A1B9A);  // สีม่วง
  static const Color soundDeepPurple = Color(0xFF4A148C); // ม่วงเข้มสำหรับเน้นจุดสำคัญ

  // BACKGROUND & SECTION COLORS
  static const Color bgGreenDark = Color(0xFF1B2E1B);
  static const Color bgGreenMid = Color(0xFF2E3D2E);
  static const Color bgGreenSoft = Color(0xFF3D4D3D);

  // TEXT COLORS
  static const Color textDark = Color(0xFF121212);   // สีดำสนิท
  static const Color textLight = Color(0xFFFFFFFF);  // สีขาว

  // SPECIAL (States & CTA)
  static const Color hoverEffect = echoesBright;     // ใช้เขียวสว่างเมื่อเมาส์ชี้
  
  // CTA GREEN (ปุ่มที่ต้องการให้เด่น)
  static const Color greenCTA = Color(0xFF00C853);   // เขียวสด (ปุ่ม)
  static const Color greenCTADark = Color(0xFF008A3B); // เขียวเข้ม (icon / hover)
  static const Color greenBorder = Color(0x6600E676); // ขอบเขียวโปร่ง

  static const Color purpleCTA = soundPurple;
  static const Color koichiBorder = Color(0x4400E676);

  static const Color gray100 = Color(0xFFF5F5F5); 
  static const Color gray200 = Color(0xFFE0E0E0); 
  static const Color gray400 = Color(0xFFBDBDBD); 
  static const Color gray600 = Color(0xFF757575); 
}