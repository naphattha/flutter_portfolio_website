import 'package:flutter/material.dart';

class AppColors{
  // Primary & Accent Colors (Inspired by Golden Experience & Pink Suit)
  
  // PRIMARY COLOR: สีทอง/เหลืองสดใส (Golden Experience)
  static const Color primaryGold = Color(0xFFFFD700); // FFD700 คือรหัสสีทองมาตรฐาน
  static const Color primaryLight = Color(0xFFFFF8E1); // สีเหลืองอ่อนสำหรับพื้นหลังสว่าง
  static const Color primaryDark = Color(0xFFC7A700); // สีทองเข้มสำหรับ Shadow/Hover

  // ACCENT COLOR: สีชมพูอมม่วง/แดง (Ladybug Brooch / Suit)
  static const Color accentPink = Color(0xFFF06292); // โทนชมพูสดใส
  static const Color accentDeep = Color(0xFFC2185B); // โทนแดงเข้ม/ม่วงเข้ม

  // BACKGROUND & TEXT COLORS (Backgrounds should be simple to make Gold/Pink stand out)

  // BACKGROUND COLOR: สีพื้นหลัง (เน้นความเรียบหรู)
  static const Color backgroundLight = Color(0xFFF5F5F5); // สีขาวเทาอ่อนมาก (เหมาะสำหรับ Light Theme)
  static const Color backgroundDark = Color(0xFF1E1E1E); // สีเทาเข้มเกือบดำ (เหมาะสำหรับ Dark Theme)

  // TEXT COLOR: สีตัวอักษร
  static const Color textDark = Color(0xFF212121);   // สีดำสนิท
  static const Color textLight = Color(0xFFFFFFFF);  // สีขาว

  // SPECIAL (Hover, Button States)
  static const Color hoverEffect = primaryDark; // ใช้สีทองเข้มเมื่อเมาส์ชี้
}