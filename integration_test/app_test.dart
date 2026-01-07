import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_portfolio_website/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End Test', () {
    testWidgets('Verify project filtering and scrolling', (tester) async {
      // 1. เริ่มแอป
      app.main();
      await tester.pumpAndSettle();

      // ----------------------------------------------------------
      // ส่วนที่ 1: กดปุ่ม Web
      // ----------------------------------------------------------
      final webTab = find.text('Web').first;

      // พยายาม Scroll ไปหาปุ่ม Web ก่อน (เผื่อหน้าจอเล็ก)
      // ใช้ Finder หาตัว Widget หลักของ App เพื่อใช้ลาก (ใช้ MaterialApp ชัวร์สุด)
      await tester.scrollUntilVisible(
        webTab,
        100.0, // Scroll ทีละนิด
        scrollable: find.byType(Scrollable).first, // ให้มันหาตัวเลื่อนตัวแรก
        maxScrolls: 50, // จำกัดจำนวนครั้งกันค้าง
      );
      await tester.pumpAndSettle();

      // กดปุ่ม (ใส่ warnIfMissed: false เพื่อข้าม Warning เรื่องพิกัด)
      await tester.tap(webTab, warnIfMissed: false);
      await tester.pumpAndSettle();

      // ----------------------------------------------------------
      // ส่วนที่ 2: เลื่อนลงไปหา Contact
      // ----------------------------------------------------------
      final contactSection = find.text('Get In Touch'); // หาจาก Text แทน Key จะเจอง่ายกว่าในบางที

      // ใช้เทคนิค "Drag ลากหน้าจอ" ซึ่งเสถียรที่สุดบนเว็บ
      bool found = false;
      for (int i = 0; i < 15; i++) { // วนลูป 15 ครั้ง
        // เช็คก่อนว่าเจอหรือยัง
        if (tester.any(contactSection)) {
          found = true;
          break;
        }

        // ถ้ายังไม่เจอ ให้ลากหน้าจอขึ้น (เพื่อให้เนื้อหาเลื่อนลง)
        // ลากที่กลางจอเลย
        await tester.drag(find.byType(MaterialApp), const Offset(0, -500));
        await tester.pump(const Duration(milliseconds: 500)); // รอ Animation นิดนึง
      }

      // ----------------------------------------------------------
      // ส่วนที่ 3: ตรวจสอบผล
      // ----------------------------------------------------------
      if (!found) {
        // ถ้า drag แล้วยังไม่เจอ ลอง scrollUntilVisible
        await tester.scrollUntilVisible(
          contactSection,
          500.0,
          scrollable: find.byType(Scrollable).first,
        );
      }
      
      await tester.pumpAndSettle();
      expect(find.text('Get In Touch'), findsOneWidget);
    });
  });
}