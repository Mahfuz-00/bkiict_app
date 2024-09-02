/// Represents the response model for a user registration request.
///
/// This class holds the status and message returned after a registration attempt.
///
/// **Variables:**
/// - [message]: A String that contains the response message from the registration process.
/// - [status]: A String that indicates the status of the registration (success, failure, etc.).
class RegisterResponseModel {
  String message;
  String status;

  RegisterResponseModel({required this.message, required this.status});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(message: json['message'], status: '');
  }
}

/// Represents the request model for user registration.
///
/// This class encapsulates all the necessary information for registering a new user
/// and provides a method to convert the data into a JSON-compatible format.
///
/// **Variables:**
/// - [fullName]: A String representing the full name of the user.
/// - [email]: A String containing the user's email address.
/// - [phone]: A String representing the user's phone number.
/// - [password]: A String that holds the user's chosen password.
/// - [confirmPassword]: A String for confirming the user's password.
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