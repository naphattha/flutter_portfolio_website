import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_portfolio_website/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End Test', () {
    testWidgets('Verify project filtering and scrolling', (tester) async {
  app.main();
  
  // รอสักครู่ให้แอปโหลด (แทน pumpAndSettle)
  await tester.pump(const Duration(seconds: 2)); 

  // ทดสอบการเปลี่ยน Tab
  final webTab = find.text('Web');
  await tester.tap(webTab);
  
  // รอให้ UI อัปเดตหลังกด
  await tester.pump(const Duration(milliseconds: 500)); 

  // ทดสอบการ Scroll ไปที่ Contact
  final contactSection = find.byKey(const Key('contact-section'));
  
  await tester.scrollUntilVisible(
    contactSection,
    500.0,
    scrollable: find.byType(SingleChildScrollView).first,
  );
  
  await tester.pump(const Duration(milliseconds: 500));

  expect(find.text('Get In Touch'), findsOneWidget);
});
  });
}