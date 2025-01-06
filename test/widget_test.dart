import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_expense_tracker/presentation/screens/signup_screen.dart';

void main() {
  testWidgets('Kiểm tra hiển thị màn hình đăng ký',
      (WidgetTester tester) async {
    // Build widget cần test
    await tester.pumpWidget(const SignUpScreen());

    // Tìm kiếm các widget theo text
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Google'), findsOneWidget);
    expect(find.text('Apple ID'), findsOneWidget);
  });
}
