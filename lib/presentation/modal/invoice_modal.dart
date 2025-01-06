import 'package:flutter/material.dart';

class InvoiceModal extends StatelessWidget {
  final Map<String, dynamic> item;

  const InvoiceModal({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item['fileName'] != null
              ? Center(
                  child: Image.asset('assets/images/${item['fileName']}',
                      width: 150, height: 150))
              : Center(
                  child: Text('No Image Available',
                      style: TextStyle(color: Colors.grey))),
          const SizedBox(height: 16),
          Text(
            item['title']!,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text('Tên tệp: ${item['fileName']}'),
          Text('Ngày: ${item['date']}'),
          Text('Loại tài liệu: ${item['document_type']}'),
          Text('Danh mục: ${item['category']}'),
          Text('Tên: ${item['name']}'),
          Text('Tham chiếu: ${item['ref']}'),
          Text(
            'Tổng: ${item['total']}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Đã được duyệt: ${item['reviewed'] != null ? (item['reviewed'] ? 'Có' : 'Không') : 'Không xác định'}',
            style: TextStyle(
              color: item['reviewed'] == true
                  ? Colors.green
                  : item['reviewed'] == false
                      ? Colors.red
                      : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Đã xuất: ${item['exported'] != null ? (item['exported'] ? 'Có' : 'Không') : 'Không xác định'}',
            style: TextStyle(
              color: item['exported'] == true
                  ? Colors.green
                  : item['exported'] == false
                      ? Colors.red
                      : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text('Đóng', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
