import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_expense_tracker/presentation/screens/home_screen.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_appbar.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_drawer.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_search.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_banner.dart';

void main() {
  testWidgets('HomeScreen should display all widgets correctly',
      (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Kiểm tra AppBar
    expect(find.byType(CustomAppBar), findsOneWidget);

    // Kiểm tra WidgetSearch
    expect(find.byType(WidgetSearch), findsOneWidget);

    // Kiểm tra BannerCarousel
    expect(find.byType(BannerCarousel), findsOneWidget);

    // Kiểm tra Statistics Header
    expect(find.text('Thống kê hàng tháng'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);

    // Kiểm tra FadeItems
    expect(find.byType(FadeItem), findsNWidgets(3));

    // Kiểm tra Monthly Budget Section
    expect(find.byType(ElevatedButton), findsNWidgets(2));

    // Kiểm tra images inside Statistics Header
    expect(
        find.byWidgetPredicate((widget) =>
            widget is Image && widget.width == 150 && widget.height == 150),
        findsNWidgets(2));
  });
}
