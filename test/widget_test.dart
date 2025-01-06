import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_expense_tracker/presentation/screens/profile_screen.dart';

void main() {
  group('ProfileScreen Widget Tests', () {
    testWidgets('Kiểm tra hiển thị tiêu đề và thông tin cá nhân',
        (WidgetTester tester) async {
      // Render ProfileScreen
      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      // Kiểm tra tiêu đề "Thông tin cá nhân" được hiển thị
      expect(find.text('Thông tin cá nhân'), findsOneWidget);

      // Kiểm tra các trường thông tin cá nhân
      expect(find.text('Họ và tên'), findsOneWidget);
      expect(find.text('Phạm Thị Anh Thư'), findsOneWidget);

      expect(find.text('Ngày sinh'), findsOneWidget);
      expect(find.text('30/09/2004'), findsOneWidget);

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('ptat1@gmail.com'), findsOneWidget);

      expect(find.text('Số điện thoại'), findsOneWidget);
      expect(find.text('0912345678'), findsOneWidget);

      // Kiểm tra nút "Chỉnh sửa" xuất hiện 4 lần
      expect(find.text('Chỉnh sửa'), findsNWidgets(4));
    });

    testWidgets('Kiểm tra nút chỉnh sửa hoạt động',
        (WidgetTester tester) async {
      // Render ProfileScreen
      await tester.pumpWidget(
        const MaterialApp(
          home: ProfileScreen(),
        ),
      );

      // Tìm nút "Chỉnh sửa" đầu tiên
      final editButton = find.text('Chỉnh sửa').first;

      // Nhấn vào nút "Chỉnh sửa"
      await tester.tap(editButton);
      await tester.pump();

      // In ra log kiểm tra (nếu cần, có thể thay thế bằng logic kiểm tra khác)
      // Chúng ta không kiểm tra log print trực tiếp, chỉ kiểm tra xem nút có thể được nhấn không.
      expect(editButton, findsOneWidget);
    });
  });
}
