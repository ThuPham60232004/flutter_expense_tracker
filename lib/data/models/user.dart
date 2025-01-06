class User {
  final String token;
  final String name;
  final String profileImage;
  final String email;
  final String? phone;
  final String role;
  final String? resume;
  final String? companyId;
  final bool isEmployee;

  User({
    required this.token,
    required this.name,
    required this.profileImage,
    required this.email,
    this.phone,
    required this.role,
    this.resume,
    this.companyId,
    required this.isEmployee,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'] ?? '',
      name: json['details']['name'] ?? '',
      profileImage: json['details']['img'] ?? '',
      email: json['details']['email'] ?? '',
      phone: json['details']['phone']?.toString(),
      role: json['details']['role'] ?? '',
      resume: json['details']['resume'],
      companyId: json['details']['company'],
      isEmployee: json['details']['isEmployee'] ?? false,
    );
  }
}
