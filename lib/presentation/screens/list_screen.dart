import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/core/widgets/widget_appbar.dart';
import 'package:flutter_expense_tracker/app.dart';
import 'package:flutter_expense_tracker/presentation/modal/invoice_modal.dart';
import 'invoice_screen.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> hoaDon = [
    {
      'title': 'Costco',
      'fileName': 'image.png',
      'date': '8/3/2018',
      'total': '\$150.74',
      'document_type': 'Invoice',
      'category': 'General',
      'name': 'Costco Corporation',
      'ref': 'INV12345',
      'reviewed': true,
      'exported': false,
    },
    {
      'title': 'Costco',
      'fileName': 'image.png',
      'date': '8/3/2018',
      'total': '\$150.74',
      'document_type': 'Invoice',
      'category': 'General',
      'name': 'Costco Corporation',
      'ref': 'INV12345',
      'reviewed': true,
      'exported': false,
    },
    {
      'title': 'Amazon',
      'fileName': 'image.png',
      'date': '12/11/2020',
      'total': '\$99.99',
      'document_type': 'Receipt',
      'category': 'Online Shopping',
      'name': 'Amazon LLC',
      'ref': 'REC56789',
      'reviewed': true,
      'exported': true,
    },
    {
      'title': 'Walmart',
      'fileName': 'image.png',
      'date': '5/6/2021',
      'total': '\$45.23',
      'document_type': 'Invoice',
      'category': 'Groceries',
      'name': 'Walmart Inc.',
      'ref': 'INV67890',
      'reviewed': false,
      'exported': false,
    },
    {
      'title': 'Target',
      'fileName': 'image.png',
      'date': '9/25/2019',
      'total': '\$78.12',
      'document_type': 'Receipt',
      'category': 'General',
      'name': 'Target Corporation',
      'ref': 'REC34567',
      'reviewed': true,
      'exported': false,
    },
    {
      'title': 'Apple Store',
      'fileName': 'image.png',
      'date': '4/15/2022',
      'total': '\$1,200.00',
      'document_type': 'Invoice',
      'category': 'Electronics',
      'name': 'Apple Inc.',
      'ref': 'INV23456',
      'reviewed': true,
      'exported': true,
    },
    {
      'title': 'Best Buy',
      'fileName': 'image.png',
      'date': '7/3/2021',
      'total': '\$320.89',
      'document_type': 'Invoice',
      'category': 'Electronics',
      'name': 'Best Buy Co., Inc.',
      'ref': 'INV11223',
      'reviewed': false,
      'exported': false,
    },
    {
      'title': 'Home Depot',
      'fileName': 'image.png',
      'date': '11/8/2023',
      'total': '\$89.50',
      'document_type': 'Invoice',
      'category': 'Home Improvement',
      'name': 'The Home Depot',
      'ref': 'INV55678',
      'reviewed': false,
      'exported': true,
    },
    {
      'title': 'Starbucks',
      'fileName': 'image.png',
      'date': '3/20/2023',
      'total': '\$12.75',
      'document_type': 'Receipt',
      'category': 'Food & Beverages',
      'name': 'Starbucks Coffee',
      'ref': 'REC98765',
      'reviewed': true,
      'exported': false,
    },
    {
      'title': 'IKEA',
      'fileName': 'image.png',
      'date': '10/5/2022',
      'total': '\$450.00',
      'document_type': 'Invoice',
      'category': 'Furniture',
      'name': 'IKEA Group',
      'ref': 'INV33444',
      'reviewed': true,
      'exported': true,
    },
    {
      'title': 'Nike',
      'fileName': 'image.png',
      'date': '2/14/2021',
      'total': '\$200.00',
      'document_type': 'Receipt',
      'category': 'Sportswear',
      'name': 'Nike, Inc.',
      'ref': 'REC12321',
      'reviewed': false,
      'exported': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final inheritedTheme = AppInheritedTheme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        themeMode: inheritedTheme!.themeMode,
        toggleTheme: inheritedTheme.toggleTheme,
      ),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView.builder(
              itemCount: hoaDon.length,
              itemBuilder: (context, index) {
                final item = hoaDon[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  elevation: 5,
                  shadowColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/${item['fileName']}'),
                              radius: 30,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title'] ?? 'Unknown Title',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(item['date'] ?? 'No Date'),
                                  Text(
                                    'Tổng: ${item['total']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return InvoiceModal(item: item);
                                  },
                                );
                              },
                              child: const Text('Xem Chi Tiết'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'Danh sách hoá đơn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          OutlinedButton.icon(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InvoiceScreen()),
              );
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result)),
                );
              }
            },
            icon: const Icon(Icons.filter_list, size: 16),
            label: const Text('Thêm hoá đơn'),
            style: OutlinedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              foregroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
