class UserProfileFull {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String photo;

  UserProfileFull({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.photo,
  });

  factory UserProfileFull.fromJson(Map<String, dynamic> json) {
    return UserProfileFull(
      id: json['userId'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      photo: json['photo'],
    );
  }
}