import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_appbar.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_drawer.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_footer.dart';
import 'package:flutter_expense_tracker/app.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_search.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_banner.dart';
import 'package:flutter_expense_tracker/core/themes/primary_text.dart';
import 'package:flutter_expense_tracker/core/themes/primary_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final inheritedTheme = AppInheritedTheme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        themeMode: inheritedTheme!.themeMode,
        toggleTheme: inheritedTheme.toggleTheme,
      ),
      drawer: CustomDrawer(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _scrollOffset = scrollNotification.metrics.pixels;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 100,
                  child: WidgetSearch(),
                ),
              ),
              SizedBox(
                height: 200,
                child: BannerCarousel(),
              ),
              _buildHeader(),
              _buildStatisticsHeader(),
              ..._buildFadeItems(),
              _buildMonthlyBudgetSection(),
              _buildBlogRecent(),
              SizedBox(
                height: 330,
                child: CustomFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Khái quát chi tiêu của bạn',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://th.bing.com/th/id/R.4aae7fb4a91b602c0b773fc5bf632222?rik=g8jqV83ZRZUAEg&pid=ImgRaw&r=0',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thống kê hàng tháng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 1.0),
              _buildStatisticsDecoration(),
              const SizedBox(
                width: 180,
                child: Text(
                  '“Theo dõi chi tiêu hàng tháng của bạn, đặt ngân sách và tiết kiệm thông minh.”',
                  style: TextStyle(fontSize: 13, height: 1.5),
                ),
              ),
              _buildDeveloperInfo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsDecoration() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          height: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color.fromARGB(255, 89, 148, 185)),
          ),
        ),
        SizedBox(height: 3.0),
        SizedBox(
          width: 80,
          height: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color.fromARGB(255, 89, 148, 185)),
          ),
        ),
      ],
    );
  }

  Widget _buildDeveloperInfo() {
    return const Row(
      children: [
        SizedBox(
          width: 20,
          height: 2,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color.fromARGB(255, 89, 148, 185)),
          ),
        ),
        SizedBox(width: 8),
        Text(
          'Anh Thu',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        Text(
          ', Developer',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildFadeItems() {
    return [
      FadeItem(
        title: '01\nTheo dõi thu nhập',
        scrollOffset: _scrollOffset,
        threshold: 100,
      ),
      FadeItem(
        title: '02\nĐặt ngân sách',
        scrollOffset: _scrollOffset,
        threshold: 300,
      ),
      FadeItem(
        title: '03\nGiám sát chi tiêu',
        scrollOffset: _scrollOffset,
        threshold: 500,
      ),
    ];
  }

  Widget _buildMonthlyBudgetSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://th.bing.com/th/id/OIP.vrdwLdTW7ZcbGwgrZIcmmAHaFS?rs=1&pid=ImgDetMain'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.4),
          height: 250,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quản lý ngân sách của bạn',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Theo dõi từng đồng tiền',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Thêm chi phí',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: PrimaryTheme.buttonPrimary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Đặt ngân sách',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBlogRecent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Text(
            'Các mẹo tài chính gần đây',
            style: PrimaryText.primaryTextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.network(
            'https://th.bing.com/th/id/R.c8af6e458bda691fd1dbc873590d49a7?rik=EGwMW5QcqbjB8w&pid=ImgRaw&r=0',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Tiết kiệm thông minh',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Row(
            children: const [
              Text(
                '20 Tháng Giêng, 2023 *',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Text(
                'Bởi Chuyên gia tài chính',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            'Học các thực tiễn tốt nhất cho việc tiết kiệm tiền hiệu quả và quản lý chi tiêu thông minh. Lời khuyên thực tế cho các tình huống tài chính thực tế.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class FadeItem extends StatelessWidget {
  final String title;
  final double scrollOffset;
  final double threshold;

  const FadeItem({
    required this.title,
    required this.scrollOffset,
    required this.threshold,
  });

  @override
  Widget build(BuildContext context) {
    double opacity = 0.0;

    if (scrollOffset > threshold) {
      opacity = ((scrollOffset - threshold) / 200).clamp(0.0, 1.0);
    }
    return Opacity(
      opacity: opacity,
      child: SizedBox(
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: PrimaryText.primaryTextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (title == '01\nTheo dõi thu nhập' ||
                title == '02\nĐặt ngân sách')
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: SizedBox(
                  width: 3,
                  height: 103,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 89, 148, 185),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
