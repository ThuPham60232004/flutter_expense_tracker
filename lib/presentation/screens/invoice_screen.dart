import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<bool> _checkAndRequestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      final status = await permission.request();
      return status.isGranted;
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = pickedImage;
        });
      }
    } catch (e) {
      print("Lỗi chọn ảnh: $e");
    }
  }

  Future<void> _captureImage() async {
    final permissionGranted =
        await _checkAndRequestPermission(Permission.camera);
    if (permissionGranted) {
      final pickedImage = await _picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = pickedImage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tải lên hóa đơn')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chi tiết Hóa Đơn',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7E0E0),
                  border: Border.all(color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.receipt_long, color: Colors.black54),
                          SizedBox(width: 8),
                          Text(
                            'Tải Lên Hóa Đơn',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: _captureImage,
                            icon: Icon(Icons.camera),
                            label: Text('Chụp ảnh'),
                          ),
                          SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: Text('Chọn ảnh từ thư viện'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      _selectedImage != null
                          ? Column(
                              children: [
                                Image.file(File(_selectedImage!.path)),
                                SizedBox(height: 8),
                                Text(
                                  'Đường dẫn: ${_selectedImage!.path}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            )
                          : Text(
                              'Chưa có tệp nào được chọn.',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Thông Tin Hóa Đơn',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Số Hóa Đơn *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tên Khách Hàng *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Trạng Thái Thanh Toán *',
                  border: OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(child: Text('Đã Thanh Toán'), value: 'Paid'),
                  DropdownMenuItem(
                      child: Text('Chưa Thanh Toán'), value: 'Unpaid'),
                  DropdownMenuItem(child: Text('Quá Hạn'), value: 'Overdue'),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 24),
              Text(
                'Ghi Chú Thêm (Tùy Chọn)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Thêm ghi chú...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Gửi hóa đơn thành công!')),
                    );
                  },
                  child: Text('Gửi Hóa Đơn'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
