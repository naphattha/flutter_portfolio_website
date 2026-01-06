
import 'package:flutter_portfolio_website/screens/widgets/project_card.dart';
import 'package:flutter_test/flutter_test.dart';
// สมมติว่าไฟล์ข้อมูลของคุณอยู่ที่นี่

void main() {
  group('Project Data Filtering Tests', () {
    test('Filtering "Web" category should return only web projects', () {
      // 1. จำลองข้อมูล (Mock Data)
      List<Project> mockData = [
        Project(title: "P1", category: "Web", tags: ["Flutter", ], image: '', description: '', projectUrl: ''),
        Project(title: "P2", category: "Mobile", tags: [], image: '', description: '', projectUrl: ''),
        Project(title: "P3", category: "Web", tags: [], image: '', description: '', projectUrl: ''),
      ];

      // 2. จำลอง Logic การกรอง
      String filter = "Web";
      List<Project> result = mockData.where((p) => p.category == filter).toList();

      // 3. ตรวจสอบผลลัพธ์
      expect(result.length, 2);
      expect(result.every((p) => p.category == "Web"), true);
    });

    test('Filtering "All" should return every project', () {
      List<Project> mockData = [
        Project(title: "P1", category: "Web", tags: [], image: '', description: '', projectUrl: ''),
        Project(title: "P2", category: "Mobile", tags: [], image: '', description: '', projectUrl: ''),
      ];

      String filter = "All";
      List<Project> result = filter == "All" ? mockData : [];

      expect(result.length, 2);
    });
  });
}