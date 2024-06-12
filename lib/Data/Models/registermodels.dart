class RegisterResponseModel {
  String message;
  String status;

  RegisterResponseModel({required this.message, required this.status});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(message: json['message'], status: '');
    //return RegisterResponseModel(message: json['message'], status: json['status']);
  }
}

class RegisterRequestmodel {
  late String fullName;
  late String email;
  late String phone;
  late String password;
  late String confirmPassword;


  RegisterRequestmodel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> map = {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': confirmPassword,
    };

    return map;
  }
}